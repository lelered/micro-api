module MicroApi
  class Engine < ::Rails::Engine
    isolate_namespace MicroApi
    config.generators.api_only = true

    config.generators do |g|
      g.test_framework :rspec,
        controller_specs: true,
        fixtures:         false,
        helper_specs:     false,
        request_specs:    true,
        routing_specs:    true,
        view_specs:       false
    end

    initializer "mse.processors" do |app|
      if MicroApi.automount_routes
        app.routes.append do
          mount MicroApi::Engine, at: MicroApi.routes_path, as: "mse"
        end
      end
    end
  end
end
