class ContactMailersController < ApplicationController

  def create
    @mailer = ContactMailer.new (mailer_params)
    if @mailer.save
      ContactMailer.contact_mail(@mailer).deliver
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  private

  def contact_params
    params.require(:contactmailer).require(:name, :message)
  end
end
