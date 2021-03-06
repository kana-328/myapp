require 'rails_helper'
RSpec.describe "Conditions", type: :request do
  describe "GET new_pet_condition" do
    let(:pet) { create(:pet) }
    let(:user) { create(:user) }
    let!(:conditions) { create_list(:condition, 20, pet: pet) }

    before do
      sign_in user
      get new_pet_condition_path(pet_id: pet.id)
    end

    it '200レスポンスが返ってくる' do
      expect(response.status).to eq 200
    end

    it 'conditionが10件表示されている' do
      expect(assigns(:conditions).size).to eq 10
    end
  end

  describe "POST pet_conditions_path" do
    let(:pet) { create(:pet) }
    let(:user) { create(:user) }
    let(:condition) { build(:condition, pet: pet) }
    let(:condition_params) { attributes_for(:condition) }

    context '有効なconditionの登録の場合' do
      before do
        sign_in user
        post pet_conditions_path(pet_id: pet.id), params: { condition: condition_params }
      end

      it "conditionの数が１増える" do
        expect { post pet_conditions_path(pet_id: pet.id), params: { condition: condition_params } }.to change(Condition, :count).by(+1)
      end

      it '200レスポンスが返ってくる' do
        expect(response.status).to eq 200
      end
    end

    context '無効なconditionの登録の場合' do
      let(:user) { create(:user) }

      before do
        sign_in user
        post pet_conditions_path(pet_id: pet.id), params: { condition: { recorded_date: '' } }
      end

      it "conditionの数は変わらない" do
        expect do
          post pet_conditions_path(pet_id: pet.id), params: { condition: { recorded_date: '' } }
        end.to change(Condition, :count).by(0)
      end

      it 'newページにrenderされる' do
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PATCH /conditions/:id/edit" do
    let(:pet) { create(:pet) }
    let(:user) { create(:user) }
    let(:condition) { create(:condition, pet: pet) }
    let(:condition_params) { attributes_for(:condition) }

    it '200レスポンスが返ってくる' do
      sign_in user
      get edit_condition_path(id: condition.id)
      expect(response.status).to eq 200
    end

    context 'ペット情報を正常に更新した時' do
      before do
        sign_in user
        patch condition_path(id: condition.id), params: { condition: condition_params }
      end

      it "302レスポンスが返ってくる" do
        expect(response.status).to eq 302
      end

      it "期待しているページにリダイレクトされる" do
        expect(response).to redirect_to new_pet_condition_path(pet_id: condition.pet_id)
      end

      it "更新した値に期待する値が入っている" do
        patch condition_path(id: condition.id), params: { condition: { comment: 'test' } }
        expect(assigns(:condition).comment).to include "test"
      end
    end
  end

  describe "DELETE condition/:id" do
    let(:pet) { create(:pet) }
    let(:user) { create(:user) }
    let!(:condition) { create(:condition, pet: pet) }

    before do
      sign_in user
      get user_pets_path(user_id: pet.user_id)
    end

    context 'Conditionを削除した時' do
      it 'ユーザーページにリダイレクトされる' do
        delete condition_path(id: condition.id)
        expect(response).to redirect_to new_pet_condition_path(pet_id: condition.pet_id)
      end

      it "Conditionの数が１減る" do
        expect do
          delete condition_path(id: condition.id)
        end.to change(Condition, :count).by(-1)
      end
    end
  end
end
