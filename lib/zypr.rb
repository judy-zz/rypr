require 'yaml'
require 'httparty'

class Zypr
  include HTTParty
  @@config = YAML.load(File.read("config.yml"))["ZYPR"]
  base_uri @@config['base_domain']

  def self.create(username, password, password_confirm)
    result = self.request("auth/create_user", 
      :username => username,
      :password => password,
      :password_confirm => password_confirm
    )["response"]["information"]
    
    result["code"] == 200 && result["status"] == "OK"
  end

  def initialize(username, password)
    result = self.request("auth/login", :username => username, :password => password)["response"]["information"]
    if result["code"] == 200 && result["status"] == "OK"
      @token = result["token"]
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
      options[:key] = @@config['app']['api_key']
    end
    result = get("/api/v#{@@config['version']}/#{path}/", :query => options)
  end
end
