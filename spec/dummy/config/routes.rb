Rails.application.routes.draw do
  mount MicroApi::Engine => "/micro_api"
end
