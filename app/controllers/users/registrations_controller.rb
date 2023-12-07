class Users::RegistrationsController < Devise::RegistrationsController
    before_action :configure_sign_up_params, only: [:create]
    before_action :configure_account_update_params, only: [:update]

  def new
    # Get the parameter from the URL
    if params[:role]
        @role = params[:role]
    else
        @role = "Student"
    end
    if params[:course]
        @course = Course.find(params[:course])
        @course_id = :course
    end

    # Call the Devise registrations controller
    super
  end

  private

  def configure_sign_up_params
    # Permit additional parameters to be passed during registration
    devise_parameter_sanitizer.permit(:sign_up, keys: [:your_parameter])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email, :password, :password_confirmation, :current_password, :course_id])
  end
end
