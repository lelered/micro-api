require 'lograge'

module MicroApi
  class Engine < ::Rails::Engine
    isolate_namespace MicroApi
    config.generators.api_only = true

    initializer "micro_api.lograge.init" do |app|
      app.configure do
        config.lograge.enabled = true
        config.lograge.base_controller_class = "ActionController::API"
        config.lograge.formatter = Lograge::Formatters::Json.new
        config.colorize_logging = false
        config.lograge.logger = ActiveSupport::Logger.new($stdout)

        config.lograge.ignore_custom = lambda do |event|
          event.payload[:path] == "#{MicroApi.routes_path}/healthz" && event.payload[:request].remote_ip =~ /^10\./
        end
        config.lograge.custom_payload do |controller|
          {
            level: :info,
            log_type: :rails,
            request_id: controller.request.request_id,
            host: controller.request.host,
            remote_ip: controller.request.remote_ip,
            image_tag: ENV['IMAGE_TAG']
          }
        end
      end
    end

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
