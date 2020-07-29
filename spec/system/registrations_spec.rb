require 'rails_helper'
RSpec.describe 'Registrations', type: :system do
  let(:user) { build(:user) }

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
end
