module MicroApi
  class Engine < ::Rails::Engine
    isolate_namespace MicroApi
    config.generators.api_only = true
  end
end
