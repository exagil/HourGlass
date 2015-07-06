class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    # terenary operator doesn't work here - why?
    if resource.try(:admin?)
      return dashboard_path
    else
      return welcome_path
    end
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
  end

  private
	  def redirect_to_activity_if_signed_in
  		redirect_to welcome_path if user_signed_in?
	  end

	  def authenticate_user
	  	redirect_to root_path unless signed_in?
	  end

    def authenticate_admin
      redirect_to root_path unless current_user.try(:admin?)
    end
end