class ActivitiesController < ApplicationController
	include ActivitiesHelper
	before_filter :redirect_to_root_if_not_logged_in
	before_action :set_todays_activity

	def index
		@activities = current_user.activities.all
	end

	def edit
		
	end

	def update
		@todays_activity = current_user.todays_activity
		updated_activity = convert_to_24_hours(params_activity)
		@todays_activity.update(updated_activity)
		respond_to do |format|
			format.html {redirect_to welcome_path}
			format.js
		end
	end

	private
		def params_activity
			params.require(:activity).permit(:start_time, :end_time)
		end

		def set_todays_activity
			@todays_activity = current_user.todays_activity
		end
end
