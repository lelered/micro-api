require 'micro_api'

MicroApi.setup do |config|
  config.automount_routes = true
  config.routes_path = "/mse" # Used only when automount_routes is true
end
