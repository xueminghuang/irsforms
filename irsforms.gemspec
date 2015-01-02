# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'irsforms/version'

Gem::Specification.new do |s|
  s.name        = 'irsforms'
  s.version     = IRSForms::VERSION.dup
  s.summary     = 'Create IRS Forms'
  s.description = 'Create IRS Forms.'
  s.email       = 'xueming.huang@gmail.com'
  s.homepage    = 'https://github.com/xueminghuang/irsforms'
  s.authors     = ['Xueming Huang']

  s.extra_rdoc_files = ['README.md']

  s.files        = Dir.glob('lib/**/*') + %w{MIT-LICENSE README.md}
  s.test_files   = Dir.glob('examples/**/*')
  s.require_path = 'lib'

  s.add_development_dependency('rake')
  s.add_development_dependency('rspec', '~> 2.0')
end