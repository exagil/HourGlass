# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean          default("f")
#  name                   :string
#

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
