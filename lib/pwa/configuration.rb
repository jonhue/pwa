# frozen_string_literal: true

module Pwa
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield configuration
  end

  class Configuration
    attr_accessor :apps

    def initialize
      @apps = []
    end

    def define_app(name, scope = nil)
      @apps << ::Pwa::App.new(name, scope)
    end
  end
end
