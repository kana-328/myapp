require 'rails_helper'
RSpec.describe 'Sessions', type: :system do
  
  let(:user) { create(:user) }

  before do
    driven_by(:rack_test)
    visit root_path
  end

  it '期待しているタイトルが表示される' do
    within('div#text-center')
    expect(page).to have_content 'ログイン'
  end

  it '期待しているフォーム名が表示される' do
    within('div#form-control')
    expect(page).to have_content 'メールアドレス'
    expect(page).to have_content 'パスワード'
  end

  it '期待しているリンク名が表示されている' do
    expect(page).to have_content '新規登録'
    expect(page).to have_content '利用規約'
    expect(page).to have_content 'パスワードを忘れた方'
  end

  context 'フォームの入力が正常にされた時' do

    it 'ログインが成功し期待してるメッセージが表示される' do
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      expect(page).to have_content 'ログインしました'
    end
  end

  context 'フォームの入力に誤りがあった時' do

    it 'ログインが失敗しエラーメッセージが表示される' do
      fill_in 'user[email]', with: "error"
      fill_in 'user[password]', with: "error"
      click_button 'ログイン'
      expect(page).to have_content 'メールアドレスまたはパスワードが違います。'
    end
  end
end
