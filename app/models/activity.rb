include ActionView::Helpers::TextHelper
class Activity < ActiveRecord::Base
	belongs_to :user

	def total_time_spent_in_words
		s_time = Time.parse(start_time.to_s)
		e_time = Time.parse(end_time.to_s)
		total_spent = (e_time - s_time)
		hours = (total_spent/3600).to_i
		minutes = ((total_spent - (hours*3600))/60).to_i
		"#{pluralize(hours, 'hour') + ' and' if hours!=0} #{pluralize(minutes, 'minute')}"
	end

	def friendly_created_at
		created_at.strftime('%A, %d %B, %Y')
	end
end