require 'rails_helper'

RSpec.describe "Bodies", type: :request do
  describe "GET /new" do
    let(:pet) { create(:pet) }
    let(:body) { build_stubbed(:body) }

    it "200レスポンスが返ってくる" do
      get new_pet_body_path(pet_id: pet.id)
      expect(response.status).to eq 200
    end

    it '期待した値は入っている' do
      get new_pet_body_path(pet_id: pet.id)
      post pet_bodies_path(pet_id: pet.id), params: { body: { weight: 5.0 } }
      expect(assigns(:body).weight).to eq 5.0
    end
  end
end
