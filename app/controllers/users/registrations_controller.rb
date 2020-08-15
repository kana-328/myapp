class Users::RegistrationsController < Devise::RegistrationsController
  before_action :admin_user, only: :destroy

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

  def edit
    @user = User.find(params[:id])
  end

  protected

  def params_user
    params.require(:user).permit(:email, :firstname, :lastname, :address, :tel, :password, :password_confirmation)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end

  def after_update_path_for(resource)
    user_pets_path(resource)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
end
