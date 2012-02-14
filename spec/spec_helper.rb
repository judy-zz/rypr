$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

major, minor, patch = RUBY_VERSION.split('.')

require 'simplecov'
SimpleCov.start

require 'zypr'
require 'rspec'

CONFIG = YAML.load(File.read("config.yml"))["ZYPR"]

# Debug output
class Zypr
  debug_output $stdout
end
