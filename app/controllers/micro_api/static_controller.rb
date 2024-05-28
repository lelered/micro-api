module MicroApi
  class StaticController < ApplicationController
    def healthz
      render json: {
        db: active_record_check,
        status: :ok
      }
    end

    def version
      render json: {
        ac:   Rails.application.class.to_s.split("::").first, # app code
        cenv: ENV.fetch("CLOUD_ENV", "local"),                # cloud env
        env:  Rails.env,                                      # rails env
        av:   app_version,
        itag: ENV.fetch("IMAGE_TAG", nil),                    # image tag
      }
    end

    def no_route_matches
      exception = ActionController::RoutingError.new("No route matches [#{request.method}] #{request.path}")
      render json: { error: exception.message }, status: :not_found
    end

    private

    def app_version
      Rails.application.class::VERSION
    rescue StandardError
      nil
    end

    def active_record_check
      return { status: :nd } unless defined?(ActiveRecord)

      ActiveRecord::Base.establish_connection # Establishes connection
      ActiveRecord::Base.connection           # Calls connection object
      { status: ActiveRecord::Base.connected? ? :connected : :not_connected }
    rescue StandardError
      { status: :exception }
    end
  end
end
