class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :display_name]
  end

  def authorize_teacher!
    if !current_user.teacher?
      redirect_to root_path, notice: "Student accounts do not have access to that feature."
    end
  end

  def authorize_student!
    if !current_user.student?
      redirect_to root_path, notice: "Teacher accounts do not have access to that feature."
    end
  end
end
