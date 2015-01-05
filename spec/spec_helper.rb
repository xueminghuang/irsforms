require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'irsforms'
require 'date'

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
end