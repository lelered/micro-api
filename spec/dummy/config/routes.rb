Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api, defaults: { format: :json } do
  end

  # Defines the root path route ("/")
  # root "articles#index"

  # mount MicroApi::Engine => "/micro_api"

  mount MicroApi::Engine, at: MicroApi.routes_path, as: '/mse'
  match '*path', to: 'micro_api/static#no_route_matches', via: :all
end
