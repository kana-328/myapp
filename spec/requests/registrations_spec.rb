require 'rails_helper'
RSpec.describe 'Registrations', type: :request do
  describe "GET signup_path" do
    let(:user) { build_stubbed(:user) }
    let(:error_user_params) { { firstname: '' } }
    let(:user_params) { attributes_for(:user) }

    it '顧客登録画面のリクエストが成功すること' do
      get signup_path
      expect(response.status).to eq 200
    end

    context '有効なユーザーの登録の場合' do
      it "Userの数が１増える" do
        expect do
          post signup_path, params: { user: user_params }
        end.to change(User, :count).by(1)
      end

      it "302レスポンスが返ってくる" do
        post signup_path, params: { user: user_params }
        expect(response.status).to eq 302
      end

      it "ペット新規登録画面にリダイレクトされる" do
        post signup_path, params: { user: user_params }
        expect(response).to redirect_to "/users/#{assigns(:user).id}/pets/new"
      end
    end

    context '無効なユーザーの登録の場合' do
      it 'Userの数は変わらない' do
        expect do
          post signup_path, params: { user: error_user_params }
        end.to change(User, :count).by(0)
      end

      it 'newページにrenderされる' do
        post signup_path, params: { user: error_user_params }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET user_edit_registration_path" do
    let(:user) { create(:user) }
    let(:user_params) { attributes_for(:user) }

    before do
      sign_in user
      get user_edit_registration_path(id: user.id)
    end

    it 'ユーザー編集画面のリクエストが成功すること' do
      expect(response.status).to eq 200
    end

    context 'ユーザー情報を更新した時' do
      it "302レスポンスが返ってくる" do
        patch users_registration_path(id: user.id), params: { user: user_params }
        expect(response.status).to eq 302
      end

      it "編集した値に期待する値が入っている" do
        patch users_registration_path(id: user.id), params: { user: { firstname: 'test.firstname' } }
        expect(assigns(:user).firstname).to include "test.firstname"
      end

      it "期待しているページにリダイレクトされる" do
        patch users_registration_path(id: user.id), params: { user: user_params }
        expect(response).to redirect_to user_pets_path(user_id: user.id)
      end
    end
  end

  describe "DELETE pet/:id" do
    let!(:user) { create(:user) }
    let(:pet_params) { attributes_for(:pet) }

    before do
      sign_in user
    end

    context 'ユーザーを削除した時' do
      it 'ユーザーページにリダイレクトされる' do
        delete user_registration_path(id: user.id)
        expect(response).to redirect_to root_path
      end

      it "Userの数が１減る" do
        expect do
          delete users_registration_path(id: user.id)
        end.to change(User, :count).by(-1)
      end

      it "conditionも一緒に消える" do
        user.pets.create(pet_params)
        expect { user.destroy }.to change(Pet, :count).by(-1)
      end
      
      it 'ユーザーページにリダイレクトされる' do
        delete user_registration_path(id: user.id)
        expect(response).to redirect_to root_path
      end
    end
  end
end
