require 'rails_helper'
RSpec.describe 'Registrations', type: :request do
  describe "GET users/registrations/new" do

    let(:user){ build_stubbed(:user) }
    let(:user_params) { {firstname: user.firstname,
                          email: user.email,
                          tel: user.tel,
                          password: user.password,
                          password_confirmation: user.password_confirmation } }
    let(:non_user_params) { {firstname: '' } }


    it '顧客登録画面のリクエストが成功すること' do
      get signup_path
      expect(response.status).to eq 200
    end

    context '有効なユーザーの登録の場合' do
      it "Userの数が１増える" do
        expect{
          post signup_path, params: { user: user_params }
        }.to change(User, :count).by(1)
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
        expect{
          post signup_path, params: { user: non_user_params }
        }.to change(User, :count).by(0)
      end
    end
  end
end
