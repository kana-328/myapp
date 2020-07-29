require 'rails_helper'
RSpec.describe 'Registrations', type: :request do

  describe "GET users/registrations/new" do
    before do
      get signup_path
    end

    it '顧客登録画面のリクエストが成功すること' do
      expect(response.status).to eq 200
    end
  end
end