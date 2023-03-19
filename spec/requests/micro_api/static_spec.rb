require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /healthz" do
    it "returns http success" do
      get "/micro_api/healthz"
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json).not_to be_empty
      expect(json).to have_key('status')
    end
  end

  describe "GET /version" do
    it "returns http success" do
      get "/micro_api/version"
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json).not_to be_empty
      expect(json).to have_key('env')
      expect(json).to have_key('cenv')
      expect(json).to have_key('itag')
    end
  end
end
