class Activity < ActiveRecord::Base
	validates :start_time, presence: true
	validates :end_time, presence: true
	belongs_to :user

	def hours_spent
		((end_time - start_time)/3600)
	end

	def friendly_created_at
		created_at.strftime('%A, %d %B, %Y')
	end
end
