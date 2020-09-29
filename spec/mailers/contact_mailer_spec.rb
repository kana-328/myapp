require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
  describe "send_email" do
    let!(:user) { create(:user) }
    let(:pet) { create(:pet, user: user) }
    let(:condition) { create(:condition, pet: pet) }
    let(:contact) { create(:contact) }
    let!(:mail) { ContactMailer.email_to_user(condition, contact) }

    it "ユーザーのメールに送信すること" do
      expect(mail.to).to eq [user.email]
    end

    it "サポート用のメールアドレスから送信すること" do
      expect(mail.from).to eq ['notifications@example.com']
    end

    it "正しい件名であること" do
      expect(mail.subject).to eq '今日のご様子'
    end
  end
end
