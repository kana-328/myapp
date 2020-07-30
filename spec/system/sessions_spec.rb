require 'rails_helper'
RSpec.describe 'Sessions', type: :system do
  let(:user) { build(:user) }

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
end
