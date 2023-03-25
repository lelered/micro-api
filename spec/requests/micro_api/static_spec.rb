require 'rails_helper'

RSpec.describe "Statics", type: :request do
  describe "GET /" do
    it "returns http success" do
      get "#{MicroApi.routes_path}/"
      expect(response).to have_http_status(:not_found)
      expect(response.header['Content-Type']).to include 'application/json'
      expect(json).not_to be_empty
    end
  end
end
