require 'rails_helper'

RSpec.describe "Carts", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/cart/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /edit" do
    it "returns http success" do
      get "/cart/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /confirmation" do
    it "returns http success" do
      get "/cart/confirmation"
      expect(response).to have_http_status(:success)
    end
  end

end
