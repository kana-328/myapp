require 'rails_helper'
RSpec.describe 'Conditions', type: :system, js: true do
  describe "GET new_pet_condition" do
    before do
      driven_by(:rack_test)
      visit new_pet_condition_path(pet_id: pet.id)
    end

    let!(:condition) { create(:condition, pet: pet) }
    let!(:pet) { create(:pet) }

    context 'フォームの必要な情報が入力された時' do
      pending '期待しているメッセージが表示される' do
        choose 'condition_recorded_at_朝'
        fill_in 'condition[comment]', with: condition.comment
        click_button '登録'

        expect(page).to have_content '記入しました'
        expect(page).to have_content 'pet.name'
        expect(page).to have_content '元気'
        expect(page).to have_content '食欲'
        expect(page).to have_content '排便'
        expect(page).to have_content '排尿'
        expect(page).to have_content '嘔吐'
        expect(page).to have_content '投薬'
        expect(page).to have_content 'コメント'
        expect(page).to have_content 'スタッフ'
        expect(page).to have_content '編集'
        expect(page).to have_content '削除'
      end
    end

    context 'フォームの必要な情報が入力されなかったとき時' do
      it 'バリデーションのエラーメッセージが表示され' do
        fill_in 'condition[comment]', with: condition.comment
        click_button '登録'
        expect(page).to have_content '記入が失敗しました'
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
