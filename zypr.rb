require 'yaml'

class Zypr
  @@config = YAML.load(File.read("config.yml"))["ZYPR"]

end
