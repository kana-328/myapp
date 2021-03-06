require 'rails_helper'
RSpec.describe 'Sessions', type: :request do
  describe "GET users/sessions/new" do
    before do
      get login_path
    end

    let(:user) { create(:user) }

    it '200レスポンスが返ってくる' do
      expect(response.status).to eq 200
    end

    it "ログイン後期待しているページが表示される" do
      post login_path, params: { user: { email: user.email, password: user.password } }
      expect(response.status).to eq 302
      expect(response).to redirect_to "/reservations"
    end
  end
end
