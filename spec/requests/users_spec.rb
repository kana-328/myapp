require 'rails_helper'
RSpec.describe 'Sessions', type: :request do
  describe "GET /index" do
    let!(:users) { create_list(:user, 30) }
    let(:user) { create(:user) }

    before do
      sign_in user
    end

    it "リクエストが成功すること" do
      get users_path
      expect(response).to have_http_status "200"
    end

    it "CSV出力のリクエストが成功すること" do
      get users_path(format: :csv)
      expect(response).to have_http_status "200"
    end

    it 'userが20件表示されている' do
      get users_path
      expect(assigns(:users).size).to eq 20
    end

    context "ログインページにアクセスした時" do
      it "reservation_pathにリダイレクトされる" do
        get login_path
        expect(response).to redirect_to "/reservations"
      end
    end
  end
end
