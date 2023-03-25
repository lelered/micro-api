Rails.application.routes.draw do
  # mount MicroApi::Engine => "/micro_api"
  mount MicroApi::Engine, at: MicroApi.routes_path, as: '/mse'
  match '*path', to: 'micro_api/static#no_route_matches', via: :all
end
