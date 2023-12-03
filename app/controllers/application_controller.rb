class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters,:authenticate_user!, if: :devise_controller?
  
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :courses, :role])
    end
  end