# frozen_string_literal: true

require 'rails/generators'
require 'rails/generators/migration'

module Pwa
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    source_root File.join File.dirname(__FILE__), '../templates/install'
    desc 'Install Progressive Web Apps for Rails'

    def create_initializer
      template 'initializer.rb', 'config/initializers/pwa.rb'
    end

    def create_files
      template 'service-worker.js', 'public/pwa-sw.js'
    end
  end
end
