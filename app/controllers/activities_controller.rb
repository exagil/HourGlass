class ActivitiesController < ApplicationController
	before_action :redirect_to_root_if_not_logged_in

	def index
		@activities = Activity.all
	end

	def new
		@todays_activity = Activity.new
	end

	def create
		fail
	end

	private
	def params_activity
		params.require(:activity).permit(:start_time, :end_time)
	end
end
