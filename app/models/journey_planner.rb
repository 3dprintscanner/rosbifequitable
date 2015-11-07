class JourneyPlanner
require 'httparty'
require 'json'
require 'pry'


def self.plan(origin, destination)
	# make the request to the exernal API and receive the journey planning results 
	begin
		request = HTTParty.get("https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=#{GOOGLE_API_KEY}")
		response = JSON.parse(request.body)
		return response
	rescue
		return "journey request failed response:  #{response} " 
	end

end



# journey planner, interfaces with an external journey planning API,
# returns a plain journey plan


end