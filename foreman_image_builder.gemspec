require File.expand_path('lib/foreman_image_builder/version', __dir__)

Gem::Specification.new do |s|
  s.name        = 'foreman_image_builder'
  s.version     = ForemanImageBuilder::VERSION
  s.metadata    = { 'is_foreman_plugin' => 'true' }
  s.license     = 'GPL-3.0'
  s.authors     = ['Ondrej Ezr']
  s.email       = ['ezrik12@gmail.com']
  s.homepage    = 'https://theforeman.org'
  s.summary     = 'Foreman plugin providing integration with Image builder.'
  # also update locale/gemspec.rb
  s.description = 'This plugin provides integration with Image builder, allowing users to create and manage images for provisioning with Foreman.'

  s.files = Dir['{app,config,db,lib,locale,webpack}/**/*'] + ['LICENSE', 'Rakefile', 'README.md', 'package.json']
  s.test_files = Dir['test/**/*'] + Dir['webpack/**/__tests__/*.js']

  s.required_ruby_version = '>= 2.7'

  s.add_development_dependency 'rdoc'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'rubocop-minitest'
  s.add_development_dependency 'rubocop-performance'
  s.add_development_dependency 'rubocop-rails'
end
