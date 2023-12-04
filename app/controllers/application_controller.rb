class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters,:authenticate_user!, if: :devise_controller?

    def current_ability
      @current_ability ||= Ability.new(current_user)
    end

    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first, :last, :courses, :role])
    end
  end