require 'rails_helper'

RSpec.describe "UserSessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/user_session/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/user_session/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/user_session/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
