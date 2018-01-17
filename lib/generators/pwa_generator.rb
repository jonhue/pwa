require 'rails/generators'
require 'rails/generators/migration'

class PwaGenerator < Rails::Generators::Base

    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), 'templates'
    desc 'Install Progressive Web Apps for Rails'

    def create_view
        template 'view.html.erb', 'app/views/pwa/offline/index.html.erb'
    end

    def create_manifest
        template 'manifest.json', 'public/manifest.json'
    end

    def create_service_worker
        template 'service_worker.js', 'public/pwa-sw.js'
    end

end
