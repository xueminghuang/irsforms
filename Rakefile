#!/usr/bin/env rake

require 'rubygems'
require 'bundler/setup'
Bundler.require
require 'irsforms/version'

require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task :default  => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "irsforms #{IRSForms::VERSION}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

task :build do
  system 'gem build irsforms.gemspec'
end

task :release => :build do
  system "gem push irsforms-#{IRSForms::VERSION}.gem"
end