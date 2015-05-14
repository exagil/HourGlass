require 'rails_helper'

describe "The Activity View", type: :feature do 

	let(:activity){ Activity.create(start_time: DateTime.new, end_time: DateTime.now+1.day) }

	before(:each){ visit activities_path }

	context "index page" do 

		it "shows today's date" do 
			date = Date.today.strftime('%A, %d %B, %Y')
			expect(page).to have_selector('h1', text: date)
		end

	end

end