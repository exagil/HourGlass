# == Schema Information
#
# Table name: activities
#
#  id         :integer          not null, primary key
#  start_time :datetime
#  end_time   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

include ActionView::Helpers::TextHelper
class Activity < ActiveRecord::Base
	belongs_to :user

	validate :end_time_cannot_be_in_future, on: :update
	validate :end_time_cannot_be_less_than_start_time, on: :update

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

	private

		def end_time_cannot_be_in_future
			if self.end_time != nil && self.end_time > DateTime.now.change(:offset => "+0000")
				errors.add(:end_time, "You cannot set a Check Out time in future")
				self.end_time = nil 
			end
		end
		
		def end_time_cannot_be_less_than_start_time
			if self.end_time != nil && self.start_time != nil && self.end_time < self.start_time
				errors.add(:end_time, "You cannot Check Out before you Check In: Come On! Be practical")
				self.end_time = nil
			end
		end
end