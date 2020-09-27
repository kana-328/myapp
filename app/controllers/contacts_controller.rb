class ContactsController < ApplicationController

  def new
    @contact = Contact.new
    @condition = Condition.find(params[:id])

  end

  def create
    @contact = Contact.new(contact_params)
    @condition = Condition.find(params[:contact][:id])
    if @contact.save
      ContactMailer.send_mail(User.first, @condition).deliver
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