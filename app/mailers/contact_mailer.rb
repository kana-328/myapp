class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_mail(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: '今日のご様子')
  end
end
