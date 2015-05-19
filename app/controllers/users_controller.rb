class UsersController < ApplicationController
  def destroy
  	User.find(params['id']).destroy
  	redirect_to dashboard_path
  end
end