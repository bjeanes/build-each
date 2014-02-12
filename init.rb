require 'rubygems'
require 'bundler'

environment = ENV.fetch("RACK_ENV", "development").to_sym
Bundler.setup(:default, environment)

require_relative 'app'

BuildEach.environment = environment
