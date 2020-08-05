class ApplicationController < ActionController::Base
  #before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!
    def after_sign_in_path_for(resource)
      flash[:notice] = "ログインしました" 
      "/users/#{current_user.id}/pets"
    end
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:firstname, :lastname, :tel, :address])
    end
  end
