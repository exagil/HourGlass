class StaticPagesController < ApplicationController
	before_action :redirect_to_activity_if_signed_in

	def home
	end
end