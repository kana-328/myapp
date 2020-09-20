require 'rails_helper'
RSpec.describe 'Conditions', type: :system do
  describe "GET new_pet_body" do
    let(:body) { build_stubbed(:body, pet: pet) }
    let(:pet) { create(:pet) }
    let(:user) { create(:user) }

    context 'フォームに正常な情報が入力された時' do
      it '期待しているメッセージが表示される' do
        sign_in user
        visit new_pet_body_path(pet_id: pet.id)
        fill_in 'body[weight]', with: 'body.weight'
        click_button '登録'
        expect(page).to have_content '更新しました'
      end
    end
  end
end
