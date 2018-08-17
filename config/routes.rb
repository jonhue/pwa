# frozen_string_literal: true

Pwa::Engine.routes.draw do
  get 'offline', to: 'pwa/apps#offline'
  get 'manifest', to: 'pwa/apps#manifest', defaults: { format: :json }
end
