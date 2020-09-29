require 'rails_helper'
RSpec.describe 'Contacts', type: :request do
  describe "GET new_contact" do
    let(:user) { create(:user) }
    let(:pet) { create(:pet) }
    let(:condition) { create(:condition, pet: pet) }

    it '期待しているメッセージが表示される' do
      sign_in user
      get new_contact_path(id: condition.id)
      expect(response.status).to eq 200
    end
  end
end
