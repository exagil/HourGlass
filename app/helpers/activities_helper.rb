module ActivitiesHelper
	def convert_to_24_hours(params)
		if params['start_time']
			start_time = params['start_time']
			start_time.gsub!(/\A\d+/, (start_time.match(/\A\d+/)[0].to_i+12).to_s) if start_time.include?('PM')
			params['start_time'] = start_time
			return params
		elsif params['end_time']
			end_time = params['end_time']
			end_time.gsub!(/\A\d+/, (end_time.match(/\A\d+/)[0].to_i+12).to_s) if end_time.include?('PM')
			params['end_time'] = end_time
			return params
		end
	end
end