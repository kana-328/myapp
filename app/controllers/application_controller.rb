class ApplicationController < ActionController::Base
   before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:firstname, :lastname, :tel, :address])
  end

  def after_sign_out_path_for(_user)
    root_path
  end
  
  def after_sign_in_path_for(_user)
    user_pets_path(user_id: resource.id)
  end
  
end
