module MicroApi
  class StaticController < ApplicationController
    def healthz
      render json: { status: :ok }
    end

    def version
      render json: {
        ac:   Rails.application.class.to_s.split("::").first, # app code
        cenv: ENV.fetch("CLOUD_ENV", "local"),                # cloud env
        env:  Rails.env,                                      # rails env
        itag: ENV.fetch("IMAGE_TAG", nil),                    # image tag
      }
    end
  end
end
