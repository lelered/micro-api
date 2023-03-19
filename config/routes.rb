MicroApi::Engine.routes.draw do
  defaults format: :json do
    get 'healthz', to: 'static#healthz'
    get 'version', to: 'static#version'
  end
end
