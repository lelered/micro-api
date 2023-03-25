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

  end
end
