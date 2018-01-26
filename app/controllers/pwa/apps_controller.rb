module Pwa
    class AppsController < ApplicationController

        before_action :get_app

        def manifest
        end

        def offline
        end

        private

        def get_app
            @app = ::Pwa::App.find_by_url(request.original_url)[0]
        end

    end
end
