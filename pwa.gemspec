# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'pwa', 'version'), __FILE__)

Gem::Specification.new do |gem|
    gem.name                  = 'pwa'
    gem.version               = Pwa::VERSION
    gem.platform              = Gem::Platform::RUBY
    gem.summary               = 'Progressive Web Apps for Rails'
    gem.description           = 'Add a service worker and a manifest to your app, for it to be recognized as a PWA and accessed without a network connection.'
    gem.authors               = 'Jonas Hübotter'
    gem.email                 = 'me@jonhue.me'
    gem.homepage              = 'https://jonhue.me/repos/progressive-web-apps-for-rails'
    gem.license               = 'MIT'

    gem.files                 = Dir['README.md', 'CHANGELOG.md', 'LICENSE', 'lib/**/*', 'app/**/*', 'config/**/*']
    gem.require_paths         = ['lib']

    gem.required_ruby_version = '>= 2.3'

    gem.add_dependency 'railties', '>= 5.0'
    gem.add_dependency 'mozaic', '~> 2'

    gem.add_development_dependency 'rspec', '~> 3.7'
    gem.add_development_dependency 'rubocop', '~> 0.52'
end
