class ActivitiesController < ApplicationController
	def index
		@activities = Activity.all
	end

	def new
		@todays_activity = Activity.new
	end

	private
	def params_activity
		params.require(:activity).permit(:start_time, :end_time)
	end
end
