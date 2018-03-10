require 'rails/railtie'
require 'mozaic'

module Pwa
    class Railtie < Rails::Railtie

        initializer 'pwa.mozaic' do
            Mozaic.configure do |config|
                config.define_component 'pwa/manifest'
                config.define_component 'pwa/theme', default: '#FFFFFF'
            end
        end

    end
end
