# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    super
  end

  def create
    @user = User.new(params_user)
    if @user.save
      flash[:notice] = '更新しました'
      redirect_to new_user_pet_path(@user)
    else
      render 'new'
    end
  end

  private

  def params_user
    params.require(:user).permit(:email, :firstname, :lastname, :address, :tel, :password, :password_confirmation)
  end
end
