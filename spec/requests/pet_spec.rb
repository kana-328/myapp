require 'rails_helper'
RSpec.describe 'Pets', type: :request do

  describe "GET /users/:user_id/pets/new" do

    let(:user) { create(:user) }
    let(:pet) { build_stubbed(:pet, user: user) }
    let(:pet_params) { attributes_for(:pet) }

    it '顧客登録画面のリクエストが成功すること' do
      get new_user_pet_path(user_id: pet.user_id)
      expect(response.status).to eq 200
    end
  end

  describe "POST /users/:user_id/pets" do
    let(:user) { create(:user) }
    let(:pet) { build_stubbed(:pet, user: user) }
    let(:pet_params) { attributes_for(:pet) }

    before do
      get new_user_pet_path(user_id: pet.user_id)
    end

    context '有効なpetの登録の場合' do
      it "Petの数が１増える" do
        expect{
          post user_pets_path(user_id: pet.user_id), params: { pet: pet_params }
        }.to change(Pet, :count).by(1)
      end

      it "302レスポンスが返ってくる" do
        post user_pets_path(user_id: pet.user_id), params: { pet: pet_params }
        expect(response.status).to eq 302
      end

      it "ユーザーページにリダイレクトされる" do
        post user_pets_path(user_id: pet.user_id), params: { pet: pet_params }
        expect(response).to redirect_to "/users/#{assigns(:pet).user_id}/pets"
      end
    end
  end

  describe "PATCH pet/:id/edit" do

    let(:user) { create(:user) }
    let(:pet) { create(:pet, user: user) }
    let(:pet_params) { attributes_for(:pet) }

    before do
      get edit_pet_path(id: pet.id)
    end

    it '200レスポンスが返ってくる' do
      expect(response.status).to eq 200
    end
    
  context 'ペット情報を更新した時' do
    
    it "302レスポンスが返ってくる" do
      patch pet_path(id: pet.id), params: { pet: pet_params }
      expect(response.status).to eq 302
    end

    it "更新した値に期待する値が入っている" do
      patch pet_path(id: pet.id), params: { pet: {name: 'test'} }
      expect(assigns(:pet).name).to eq "test"
    end
  end
end
  describe "DELETE pet/:id" do

    let(:user) { create(:user) }
    let(:pet) { create(:pet, user: user) }

    before do
      get user_pets_path(user_id: pet.user_id)
    end

    context 'ペットを削除した時' do
      it "Petの数が１減る" do
        expect{
          delete pet_path(id: pet.id)
        }.to change(Pet, :count).by(-1)
      end

      it 'ユーザーページにリダイレクトされる' do
        delete pet_path(id: pet.id)
        expect(response).to redirect_to user_pets_path(user_id: pet.user_id)
      end
    end
  end
end