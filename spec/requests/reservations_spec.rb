require 'rails_helper'
RSpec.describe "Reservations", type: :request do
  describe "GET new_pet_condition" do
  
    before do
      get reservations_path
    end

    it '200レスポンスが返ってくる' do
      expect(response.status).to eq 200
    end
  end
end