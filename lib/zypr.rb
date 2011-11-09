require 'yaml'
require 'httparty'

class Zypr
  include HTTParty
  @@config = YAML.load(File.read("config.yml"))["ZYPR"]
  base_uri @@config['base_domain']

  def self.open_connection
    result = self.request("auth/login", :key => @@config['api_key'])
    result["response"]["information"]["code"] == 200
  end

private

  def self.request(path, options={})
    get("/api/v#{@@config['version']}/#{path}/", options)
  end
end
