require 'yaml'
require 'httparty'

class Zypr
  include HTTParty
  @@config = YAML.load(File.read("config.yml"))["ZYPR"]
  base_uri @@config['base_domain']

  def self.open_connection
    result = self.request(
      "auth/login",
      :query => {
        :key =>      @@config['api_key'],
        :username => @@config['username'],
        :password => @@config['password']
      }
    )

    if result != nil && result["response"]["information"]["code"] == 200
      @@token = result["response"]["data"][0]["token"]
      return true
    else
      return false
    end
  end

private

  def self.request(path, options={})
    get("/api/v#{@@config['version']}/#{path}/", options)
  end
end
