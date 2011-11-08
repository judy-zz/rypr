$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../..', __FILE__)
puts $:.inspect
major, minor, patch = RUBY_VERSION.split('.')

require 'simplecov'
SimpleCov.start

require 'zypr'
require 'rspec'
