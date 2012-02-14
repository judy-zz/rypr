$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

major, minor, patch = RUBY_VERSION.split('.')

require 'simplecov'
SimpleCov.start

require 'zypr'
require 'rspec'
