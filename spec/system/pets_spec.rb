require 'rails_helper'
RSpec.describe 'Pets', type: :system do
  include ActionDispatch::TestProcess
  describe "GET /users/:user_id/pets" do
    let(:user) { create(:user) }
    let(:pet) { create(:pet, user: user) }

    before do
      driven_by(:rack_test)
      visit user_pets_path(user_id: pet.user_id)
    end

    it 'ペットの情報が表示されている' do
      within('div#container')
      expect(page).to have_content '生年月日'
      expect(page).to have_content '名前'
      expect(page).to have_content '種類'
      expect(page).to have_content '性別'
      expect(page).to have_content 'プロフィール編集'
    end

    it 'オーナーの情報が表示されている' do
      within('div#container')
      expect(page).to have_content '名前'
      expect(page).to have_content '電話番号'
      expect(page).to have_content '住所'
      expect(page).to have_content 'アドレス'
      expect(page).to have_content 'ペット追加登録'
    end
  end

  describe "GET /users/:user_id/pets/new" do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:pet) { build_stubbed(:pet, user: user) }

    before do
      driven_by(:rack_test)
      sign_in admin
      visit new_user_pet_path(user_id: pet.user_id)
    end

    it '期待しているタイトルが表示される' do
      within('div#text-center')
      expect(page).to have_content 'ペット登録'
    end

    it '期待しているフォーム名が表示される' do
      within('div#form-control')
      expect(page).to have_content '生年月日'
      expect(page).to have_content '名前'
      expect(page).to have_content '種類'
      expect(page).to have_content '性別'
      expect(page).to have_content '登録'
    end

    context 'フォームの必要な情報が空白だった時' do
      it 'バリデーションのエラーメッセージが表示される' do
        fill_in 'pet[name]', with: ""
        click_on '登録'
        expect(page).to have_content '名前を入力してください'
        expect(page).to have_content '保存されませんでした'
      end
    end

    context 'フォームの入力が正常にされた時' do
      it '登録が成功し期待してるメッセージが表示される' do
        fill_in 'pet[name]', with: "pet.name"
        click_on '登録'
        expect(page).to have_content 'ペット情報を登録しました'
      end
    end
  end

  describe "PUT /pets/:id" do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }
    let(:pet) { create(:pet, user: user) }

    before do
      driven_by(:rack_test)
      sign_in admin
      visit edit_pet_path(id: pet.id)
    end

    it '期待しているタイトルが表示される' do
      within('div#text-center')
      expect(page).to have_content 'ペットプロフィール編集ページ'
    end

    it '期待しているフォーム名が表示される' do
      within('div#form-control')
      expect(page).to have_content '生年月日'
      expect(page).to have_content '名前'
      expect(page).to have_content '種類'
      expect(page).to have_content '性別'
      expect(page).to have_content '登録'
      expect(page).to have_content 'ペット削除'
    end

    context 'ペットの名前を変更した時' do
      it '期待されるメッセージと変更された名前が表示される' do
        fill_in 'pet[name]', with: "update.name"
        click_on '登録'
        expect(page).to have_content 'ペット情報を更新しました'
        expect(page).to have_content 'update.name'
      end
    end

    context "ペット削除を実行した時" do
      it "期待しているメッセージが表示される" do
        click_on 'ペット削除'
        expect(page).to have_content 'ペットを消しました'
      end
    end
  end
end
