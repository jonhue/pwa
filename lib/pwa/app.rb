module Pwa
    class App

        attr_accessor :name
        attr_accessor :scopes

        def initialize name, scopes = nil
            @name = name
            @scopes = scopes
        end

        def safe_name
            self.name.parameterize.underscore
        end

        def self.find_by_name name
            Pwa.configuration.apps.select { |app| app.name == name }
        end

        def self.find_by_url url
            Pwa.configuration.apps.select { |app| app.scopes.nil? || app.scopes.any? { |scope| url.include?(scope) } }
        end

    end
end
