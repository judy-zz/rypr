require 'yaml'

class Zypr
  @@config = YAML.load(File.read("config.yml"))["ZYPR"]

  def self.open_connection
    true
  end
end
