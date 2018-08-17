# frozen_string_literal: true

require 'rails/railtie'
require 'mozaic'

module Pwa
  class Railtie < Rails::Railtie
    initializer 'pwa.mozaic' do
      Mozaic.configure do |config|
        config.define_component 'pwa/manifest', url: 'http://localhost:3000'
        config.define_component 'pwa/theme', default: '#FFFFFF'
      end
    end
  end
end
