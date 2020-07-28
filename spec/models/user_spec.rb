require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user){ build(:user) }

  it "サンプルデータは正しい" do
    expect(user).to be_valid
  end

  it "firstnameが空白だとバリデーションにかかる" do
    user.firstname = ' '
    expect(user).not_to be_valid
  end

  it "firstnameの文字数が15文字以上だとバリデーションにかかる" do
    user.firstname = 'a'*16
    expect(user).not_to be_valid
  end

  it "lastnameの文字数が15文字以上だとバリデーションにかかる" do
    user.lastname = 'a'*16
    expect(user).not_to be_valid
  end

  it "lastnameが空白でもバリデーションにかからない" do
    user.lastname = ' '
    expect(user).to be_valid
  end

  it "emailが空白だとバリデーションにかかる" do
    user.email = ' '
    expect(user).not_to be_valid
  end

  it "emailの文字数が255文字以上だとバリデーションにかかる" do
    user.email = 'a'*256
    expect(user).not_to be_valid
  end
  
  it 'emailがユニークである' do
    user.email = User.create(email: 'foobar@email.com')
    user.email.upcase
    user.save
    expect(user).not_to be_valid
  end

  it 'メールの検証で無効なアドレスを拒否する必要がある' do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    addresses.each do |invalid_addres|
      user = build(:user, email: invalid_addres)
      expect(user).not_to be_valid
    end

  end
  it 'emailを小文字に変更後の値が大文字を混ぜて登録されたアドレスと同じか' do
    user.email = 'Foo@ExAMPle.Cpo'
    user.save!
    expect(user.reload.email).to eq 'foo@example.cpo'
  end

  it 'passwordが空白だとバリデーションにかかる' do
    user.password = user.password_confirmation = ' ' * 6
    expect(user).not_to be_valid
  end

  it 'passwordが4文字以上6文字以下である' do
      user.password = user.password_confirmation = 'a' * 3
      expect(user).not_to be_valid
      user.password = user.password_confirmation = 'a' * 4
      expect(user).to be_valid
      user.password = user.password_confirmation = 'a' * 7
      expect(user).not_to be_valid

    end

end
