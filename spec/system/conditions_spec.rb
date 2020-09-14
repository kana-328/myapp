require 'rails_helper'
RSpec.describe 'Conditions', type: :system, js: true do
  describe "GET new_pet_condition" do
    before do
      driven_by(:rack_test)
      visit new_pet_condition_path(pet_id: pet.id)
    end

    let!(:condition) { create(:condition, pet: pet) }
    let!(:pet) { create(:pet) }
    let!(:other_pet) { create(:other_pet) }
    let!(:other_condition) { create(:other_condition, pet: other_pet) }
    
    context 'フォームの必要な情報が入力された時' do
      it '期待しているメッセージが表示され、該当のペットのconditionのみ表示される' do
        choose 'condition_recorded_at_朝'
        fill_in 'condition[comment]', with: "testcomment"
        click_button '登録'
        expect(page).to have_content '記入しました'
        expect(page).to have_content "testcomment"
        expect(page).to_not have_content "other_condition.comment"
      end
    end
  end

  describe "PATCH condition_path" do
    before do
      driven_by(:rack_test)
      visit edit_condition_path(id: condition.id)
    end

    let(:condition) { create(:condition, pet: pet) }
    let(:pet) { create(:pet) }

    context 'フォームの必要な情報が入力された時' do
      it '期待しているメッセージが表示され内容が変更されている' do
        choose 'condition_recorded_at_夜'
        choose 'condition_appetite_完食'
        choose 'condition_urination_あり'
        choose 'condition_medicine_なし'
        fill_in 'condition[comment]', with: 'test.comment'
        click_button '登録'
        expect(page).to have_content '管理表を更新しました'
        expect(page).to have_content '夜'
        expect(page).to have_content '完食'
        expect(page).to have_content 'あり'
        expect(page).to have_content 'なし'
        expect(page).to have_content 'test.comment'
      end
    end
  end

  describe "DELETE condition_path" do
    let!(:condition) { create(:condition, pet: pet) }
    let!(:pet) { create(:pet) }
    let(:admin) { create(:admin) }

    before do
      driven_by(:rack_test)
    end

    it '削除される' do
      visit new_pet_condition_path(pet_id: pet.id)
      click_link '削除'
      expect(page).to have_content '管理表を消しました'
    end
  end
end
