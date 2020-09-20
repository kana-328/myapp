require 'rails_helper'
RSpec.describe "Reservations", type: :request do
  describe "GET new_pet_condition" do
    let(:user) { create(:user) }

    it '200レスポンスが返ってくる' do
      sign_in user
      get reservations_path
      expect(response.status).to eq 200
    end
  end
end
