class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def send_mail(user, condition)
    @user = user
    @condition = condition
    mail(to: @user.email, subject: '今日のご様子')
  end
end
