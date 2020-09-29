class ContactMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def email_to_user(condition, message)
    @message = message
    @condition = condition
    pet = @condition.pet_id
    @pet = Pet.find_by(id: pet)
    user = @pet.user_id
    @user = User.find_by(id: user)
    mail(to: @user.email, subject: '今日のご様子')
  end
end
