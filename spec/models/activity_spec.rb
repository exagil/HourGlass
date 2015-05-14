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
end