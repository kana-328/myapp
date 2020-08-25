class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:firstname, :lastname, :tel, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:firstname, :lastname, :tel, :address])
  end

  def after_sign_out_path_for(user)
    root_path
  end

  def after_sign_in_path_for(resource)
    reservations_path
  end
end
