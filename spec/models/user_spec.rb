require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "サンプルデータが正しい状態である" do
    expect(user).to be_valid
  end

  it "firstnameが空白だと無効な状態である" do
    user.firstname = ' '
    expect(user).not_to be_valid
  end

  it "firstnameの文字数が15文字以上だと無効な状態である" do
    user.firstname = 'a' * 16
    expect(user).not_to be_valid
  end

  it "lastnameの文字数が15文字以上だと無効な状態である" do
    user.lastname = 'a' * 16
    expect(user).not_to be_valid
  end

  it "lastnameが空白でもバリデーションにかからない" do
    user.lastname = ' '
    expect(user).to be_valid
  end

  it "emailが空白だと無効な状態であること" do
    user.email = ' '
    expect(user).not_to be_valid
  end

  it "emailの文字数が255文字以上だと無効な状態であること" do
    user.email = 'a' * 256
    expect(user).not_to be_valid
  end

  it 'emailがユニークである' do
    user.email = User.create(email: 'foobar@email.com')
    user.email.upcase
    user.save
    expect(user).not_to be_valid
  end

  it 'メールの検証で無効なアドレスを拒否する必要がある' do
    addresses = %w(user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com)
    addresses.each do |invalid_addres|
      user = build(:user, email: invalid_addres)
      expect(user).not_to be_valid
    end
  end
  it 'emailは小文字で保存される' do
    user.email = 'Foo@ExAMPle.Cpo'
    user.save!
    expect(user.reload.email).to eq 'foo@example.cpo'
  end

  it 'passwordが空白だと無効な状態であること' do
    user.password = user.password_confirmation = ' ' * 6
    expect(user).not_to be_valid
  end

  it 'passwordが4文字以上6文字以下以外は無効な状態であること' do
    user.password = user.password_confirmation = 'a' * 3
    expect(user).not_to be_valid
    user.password = user.password_confirmation = 'a' * 4
    expect(user).to be_valid
    user.password = user.password_confirmation = 'a' * 7
    expect(user).not_to be_valid
  end

  context 'passwordとpassword_confirmationが異なる場合' do
    it '無効な状態である' do
      user.password = 'pass'
      user.password_confirmation = 'word'
      expect(user).not_to be_valid
    end
  end

  context 'passwordとpassword_confirmationが同一な場合' do
    it '有効な状態である' do
      user.password = 'pass'
      user.password_confirmation = 'pass'
      expect(user).to be_valid
    end
  end
end
