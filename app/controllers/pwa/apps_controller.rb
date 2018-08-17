# frozen_string_literal: true

module Pwa
  class AppsController < ApplicationController
    before_action :set_app

    def manifest; end

    def offline; end

    private

    def set_app
      @app = Pwa::App.find_by_url(request.original_url).first
    end
  end
end
