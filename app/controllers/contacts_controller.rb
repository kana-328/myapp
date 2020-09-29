class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @condition = Condition.find(params[:id])
    pet = @condition.pet_id
    @pet = Pet.find_by(id: pet)
    user = @pet.user_id
    @user = User.find_by(id: user)
  end

  def create
    contact = Contact.new
    message = params[:message]
    condition = Condition.find(params[:contact][:id])
    if contact.save
      ContactMailer.email_to_user(condition, message).deliver
      redirect_to reservations_path
      flash[:notice] = 'メールを送信しました'
    else
      render new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:message)
  end
end
