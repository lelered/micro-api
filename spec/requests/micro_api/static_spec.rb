require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /healthz" do
    it "returns http success" do
      get "#{MicroApi.routes_path}/healthz"
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json).to have_key('status')
    end
  end

  describe "GET /version" do
    it "returns http success" do
      get "#{MicroApi.routes_path}/version"
      expect(response).to have_http_status(:success)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json.keys).to contain_exactly('ac', 'cenv', 'env', 'itag')
    end
  end

  describe "GET /" do
    it "returns http success" do
      get "#{MicroApi.routes_path}/"
      expect(response).to have_http_status(:not_found)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json).not_to be_empty
    end
  end
end
