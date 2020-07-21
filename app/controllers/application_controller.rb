class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  def configure_permitted_parameters
    devese_parameter_sanitizer.permit(:sign_up, keys: [:adrees, :name])
  end
end
