require 'rails_helper'
RSpec.describe 'Sessions', type: :request do
  describe "GET root" do
    it '200レスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end

    context "未ログインでユーザー一覧ページにアクセスした時" do
      it "ログインページにリダイレクトされる" do
        get users_path
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "GET /static_pages" do
    it '200レスポンスが返ってくる' do
      get static_pages_path
      expect(response.status).to eq 200
    end
  end

  describe "GET /static_pages/introduce" do
    it '200レスポンスが返ってくる' do
      get static_pages_introduce_path
      expect(response.status).to eq 200
    end
  end
end
