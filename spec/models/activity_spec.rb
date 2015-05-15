require 'rails_helper'

RSpec.describe Activity, type: :model do
	let(:activity){ Activity.new(start_time: DateTime.now, end_time: DateTime.now+1.day) }

	it "is valid" do 
		expect(activity).to be_valid
	end

	it "requires a start time" do 
		activity.start_time = nil
		expect(activity).to_not be_valid
	end

	it "requires an end time" do 
		activity.end_time = nil
		expect(activity).to_not be_valid
	end

	it "responds to hours_spent" do
		expect(activity).to respond_to(:hours_spent)
	end

	it "expects hours_spent method to return an instance of Float class" do 
		expect(activity.hours_spent).to be_instance_of(Float)
	end

	it "expects hours_spent method to return the difference between end_time and start_time" do 
		expect(activity.hours_spent).to be > 24
	end

	it "responds to friendly_created_at" do 
		activity_copy = Activity.create(start_time: DateTime.now, end_time: DateTime.now+1.day)
		expect(activity).to respond_to(:friendly_created_at)
	end

end