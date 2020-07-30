require 'rails_helper'
RSpec.describe 'Sessions', type: :request do
  describe "GET users/sessions/new" do
    before do
      get root_path
    end

    it 'ログイン画面のリクエストが成功すること' do
      expect(response.status).to eq 200
    end
  end
end
