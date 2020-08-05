class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!
 
    def after_sign_in_path_for(resource)
      if current_user
        flash[:notice] = "ログインしました" 
        "/users/#{current_user.id}/pets"
      else    
        flash[:notice] = "新規登録完了しました。次に名前を入力してください" 
        render 'new'
      end
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :tel, :address])
    end
  end
