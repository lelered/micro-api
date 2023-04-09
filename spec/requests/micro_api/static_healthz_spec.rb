require 'rails_helper'

RSpec.describe "Statics" do
  describe "GET /healthz" do
    before { @route = get("#{MicroApi.routes_path}/healthz") }

    it "returns http success", type: :request do
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json).to have_key('status')
    end

    it "routes /micro_api/version to the static controller", type: :routing do
      expect(@route).to route_to(
        controller: 'micro_api/static',
        action: 'healthz',
        format: :json
      )
    end
  end
end
