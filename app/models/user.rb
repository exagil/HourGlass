class User < ActiveRecord::Base
	has_many :activities
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def todays_activity
  	activities.find_or_create_by(created_at: Date.today.to_datetime)
  end
end
