require 'rails_helper'
RSpec.describe "Conditions", type: :request do
  describe "GET new_pet_condition" do
    let(:pet) { create(:pet) }

    before do
      get new_pet_condition_path(pet_id: pet.id)
    end

    it '200レスポンスが返ってくる' do
      expect(response.status).to eq 200
    end
  end

  describe "POST pet_conditions_path" do
    let(:pet) { create(:pet) }
    let(:condition) { build(:condition, pet: pet) }
    let(:condition_params) { attributes_for(:condition) }

    before do
      get new_pet_condition_path(pet_id: condition.pet_id)
    end

    context '有効なconditionの登録の場合' do
      before do
        post pet_conditions_path(pet_id: pet.id), params: { condition: condition_params }
      end

      it "conditionの数が１増える" do
        expect do
          post pet_conditions_path(pet_id: pet.id), params: { condition: condition_params }
        end.to change(Condition, :count).by(1)
      end

      it '302レスポンスが返ってくる' do
        expect(response.status).to eq 302
      end

      it "期待しているページにリダイレクトされる" do
        expect(response).to redirect_to pet_conditions_path(pet_id: condition.pet_id)
      end
    end

    context '無効なconditionの登録の場合' do
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
    let(:condition) { create(:condition, pet: pet) }
    let(:condition_params) { attributes_for(:condition) }

    it '200レスポンスが返ってくる' do
      get edit_condition_path(id: condition.id)
      expect(response.status).to eq 200
    end

    context 'ペット情報を正常に更新した時' do
      before do
        patch condition_path(id: condition.id), params: { condition: condition_params }
      end

      it "302レスポンスが返ってくる" do
        expect(response.status).to eq 302
      end

      it "期待しているページにリダイレクトされる" do
        expect(response).to redirect_to pet_conditions_path(pet_id: condition.pet_id)
      end

      it "更新した値に期待する値が入っている" do
        patch condition_path(id: condition.id), params: { condition: { comment: 'test' } }
        expect(assigns(:condition).comment).to include "test"
      end
    end
  end

  describe "DELETE condition/:id" do
    let(:pet) { create(:pet) }
    let!(:condition) { create(:condition, pet: pet) }

    before do
      get user_pets_path(user_id: pet.user_id)
    end

    context 'Conditionを削除した時' do
      it 'ユーザーページにリダイレクトされる' do
        delete condition_path(id: condition.id)
        expect(response).to redirect_to pet_conditions_path(pet_id: condition.pet_id)
      end

      it "Conditionの数が１減る" do
        expect do
          delete condition_path(id: condition.id)
        end.to change(Condition, :count).by(-1)
      end
    end
  end
end
