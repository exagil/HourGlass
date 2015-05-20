class User < ActiveRecord::Base
	has_many :activities, dependent: :destroy
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  def todays_activity
  	activities.find_or_create_by(created_at: Date.today.to_datetime)
  end

  def get_authorized_activities(params = nil)
  	if try(:admin?) && params[:user_id] == nil
  		return Activity.where.not(user_id: self.id)
  	elsif try(:admin?) && params[:user_id] != nil
  		return Activity.where(user_id: params[:user_id])
  	else
  		return activities.limit(7)
  	end
  end
end
