require 'rails_helper'

RSpec.describe "Conditions", type: :request do

  describe "GET /show" do
    it "returns http success" do
      get "/conditions/show"
      expect(response).to have_http_status(:success)
    end
  end

end
