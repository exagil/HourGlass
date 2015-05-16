class Activity < ActiveRecord::Base
	belongs_to :user, dependent: :destroy

	def total_time_spent
		s_time = Time.parse(start_time.to_s)
		e_time = Time.parse(end_time.to_s)
		hours_spent = (e_time - s_time)/3600
		hours_spent
	end

	def friendly_created_at
		created_at.strftime('%A, %d %B, %Y')
	end
end
