require 'rails/generators'
require 'rails/generators/migration'

module Pwa
    class AppGenerator < Rails::Generators::Base

        include Rails::Generators::Migration

        source_root File.join File.dirname(__FILE__), '../templates/app'
        desc 'Generate a Progressive Web Apps for Rails app'

        class_option :name, desc: 'App name', type: :string, default: 'index', aliases: '-n'

        def create_files
            @name = options[:name].parameterize.underscore
            template 'manifest.json.erb', "app/views/pwa/apps/manifests/_#{@name}.json"
            template 'offline.html.erb', "app/views/pwa/apps/offline/_#{@name}.html.erb"
        end

    end
end
