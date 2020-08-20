require 'rails_helper'
RSpec.describe 'Registrations', type: :system do
  describe "GET sign_up" do
    let(:user) { build_stubbed(:user) }

    before do
      driven_by(:rack_test)
      visit signup_path
    end

    it '期待しているタイトルが表示される' do
      within('div#text-center')
      expect(page).to have_content '顧客登録'
    end

    it '期待しているフォーム名が表示される' do
      within('div#form-control')
      expect(page).to have_content '姓'
      expect(page).to have_content '名'
      expect(page).to have_content '住所'
      expect(page).to have_content '電話番号'
      expect(page).to have_content 'メールアドレス'
      expect(page).to have_content 'パスワード(４〜６文字)'
      expect(page).to have_content 'パスワード確認用'
    end

    it '期待しているリンク名が表示されている' do
      expect(page).to have_content 'ログイン'
      expect(page).to have_content '利用規約'
    end

    context 'フォームの入力が正常にされた時' do
      it '登録が成功し期待してるメッセージが表示される' do
        fill_in 'user[firstname]', with: user.firstname
        fill_in 'user[lastname]', with: user.lastname
        fill_in 'user[tel]', with: user.tel
        fill_in 'user[email]', with: user.email
        fill_in 'user[address]', with: user.address
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        click_button '登録'
        expect(page).to have_content '更新しました'
      end
    end

    context 'フォームの必要な情報が空白だった時' do
      it 'バリデーションのエラーメッセージが表示される' do
        fill_in 'user[firstname]', with: ""
        fill_in 'user[lastname]', with: user.lastname
        fill_in 'user[tel]', with: ""
        fill_in 'user[email]', with: ""
        fill_in 'user[address]', with: user.address
        fill_in 'user[password]', with: user.password
        fill_in 'user[password_confirmation]', with: user.password_confirmation
        click_button '登録'
        expect(page).to have_content 'メールアドレスを入力してください'
        expect(page).to have_content '電話番号を入力してください'
        expect(page).to have_content '姓を入力してください'
      end
    end
  end

  describe "delete users_registration_path" do
    let(:user) { create(:user) }
    let(:admin) { create(:admin) }

    before do
      driven_by(:rack_test)
    end

    context 'adminではない時' do
      it 'アカウント削除ボタンが表示されない' do
        sign_in user
        visit user_edit_registration_path(id: user.id)
        expect(page).not_to have_content "ユーザー削除"
      end
    end

    context 'adminの場合' do
      it 'アカウント削除ボタンが表示される' do
        sign_in admin
        visit user_edit_registration_path(id: user.id)
        expect(page).to have_content "ユーザー削除"
      end
    end
  end
end
