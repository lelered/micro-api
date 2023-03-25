require 'rails_helper'

RSpec.describe "Statics" do
  describe "GET /version" do
    before { @route = get("#{MicroApi.routes_path}/version") }

    it "returns http success", type: :request do
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json.keys).to contain_exactly('ac', 'cenv', 'env', 'itag')
    end

    it "routes /micro_api/version to the static controller", type: :routing do
      expect(@route).to route_to(
        controller: 'micro_api/static',
        action: 'version',
        format: :json
      )
    end
  end
end
