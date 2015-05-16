class ActivitiesController < ApplicationController
	before_filter :redirect_to_root_if_not_logged_in
	before_action :set_todays_activity

	def index
		@activities = Activity.all
	end

	def edit
		
	end

	def update
	end

	private
		def params_activity
			params.require(:activity).permit(:start_time, :end_time)
		end

		def set_todays_activity
			@todays_activity = current_user.todays_activity
		end
end
