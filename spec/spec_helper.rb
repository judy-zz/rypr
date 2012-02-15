$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

major, minor, patch = RUBY_VERSION.split('.')

require 'simplecov'
SimpleCov.start

require 'rypr'
require 'rspec'

CONFIG = YAML.load(File.read("config.yml"))["ZYPR"]

# Debug output
module Rypr
  class Connection
    debug_output $stdout
  end
end
