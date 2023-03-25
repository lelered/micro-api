require 'micro_api'

MicroApi.setup do |config|
  config.routes_path = "/mse" # Used only when automount_routes is true
end
