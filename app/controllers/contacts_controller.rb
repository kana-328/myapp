class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = ContactMailer.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@user).deliver
      redirect_to reservations_path
      flash[:notice] = 'メールを送信しました'
    else
      render new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(:name, :message)
  end
end