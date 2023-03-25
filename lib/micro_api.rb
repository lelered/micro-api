require "micro_api/version"
require "micro_api/engine"

module MicroApi
  
  mattr_accessor :automount_routes
  @@automount_routes = true

  mattr_accessor :routes_path
  @@routes_path = "/mse"  

  def self.setup
    yield self
  end

end
