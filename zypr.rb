require 'yaml'

class Zypr
  raw_config = File.read("config.yml")
  @@ZYPR_CONFIG = YAML.load(raw_config)["ZYPR"]

end
