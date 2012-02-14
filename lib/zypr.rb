require 'yaml'
require 'httparty'
require 'pp'

class Zypr
  include HTTParty
  @@config = YAML.load(File.read("config.yml"))["ZYPR"]
  base_uri @@config['base_domain']
  attr_reader :token

  def self.open_connection
    result = self.request(
      "auth/login",
      :query => {
        :username => @@config['app']['username'],
        :password => @@config['app']['password']
      }
    )
    if result != nil && result["response"]["information"]["code"] == 200
      @@token = result["response"]["data"][0]["token"]
      return true
    else
      return false
    end
  end

  def self.create_user(username, password)
    result = self.request("auth/create_user", 
      :username => username,
      :password => password,
      :password_confirm => password
    )["response"]["information"]
    
    result["code"] == 200 && result["status"] == "OK"
  end

  def initialize(username, password)
    result = self.request("auth/login", :username => username, :password => password)
    if result["response"]["information"]["code"] == 200 && result["response"]["information"]["status"] == "OK"
      @token = result["response"]["data"][0]["token"]
      return self
    else
      raise "Incorrect username and/or password."
    end
  end

  def request(path, options={})
    options[:token] = @token
    Zypr.request(path, options)
  end

  def self.request(path, options={})
    if path == "auth/login" || path == "auth/create_user"
      options[:key] ||= @@config['api_key']
    end
    result = get("/api/v#{@@config['version']}/#{path}/", :query => options)
  end
end
