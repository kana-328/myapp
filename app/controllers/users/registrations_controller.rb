class Users::RegistrationsController < Devise::RegistrationsController
  prepend_before_action :require_no_authentication, only: [:cancel]

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

  def update
    @user = User.find(params[:id])
    if @user.update(params_user)
      flash[:notice] = 'ユーザー情報を更新しました'
      redirect_to users_path
    else
      flash[:notice] = '失敗しました'
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to users_path
    flash[:notice] = 'ユーザーを削除しました'
  end

  protected

  def params_user
    params.require(:user).permit(:email, :firstname, :lastname, :address, :tel, :password, :password_confirmation)
  end

  def params_user_update
    params.require(:user).permit(:email, :firstname, :lastname, :address, :tel)
  end

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
end
