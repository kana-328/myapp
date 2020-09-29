require 'rails_helper'
RSpec.describe 'Contacts', type: :system do
  describe "GET new_contact" do
    let(:user) { create(:user) }
    let(:pet) { create(:pet) }
    let(:condition) { create(:condition, pet: pet) }

    it '期待しているメッセージが表示される' do
      sign_in user
      visit new_contact_path(id: condition.id)
      click_on 'メール送信'
      expect(page).to have_content 'メールを送信しました'
    end
  end
end
