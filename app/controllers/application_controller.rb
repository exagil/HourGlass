class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private
	  def redirect_to_activity_if_signed_in
  		redirect_to welcome_path if user_signed_in?
	  end

	  def redirect_to_root_if_not_logged_in
	  	redirect_to root_path unless signed_in?
	  end
end
