class JourneyPlanner
require 'httparty'
require 'json'


def plan(origin, destination)
	# make the request to the exernal API and receive the journey planning results 
	begin
		request = HTTParty.get("http://maps.googleapis.com/maps/api/directions/output?origin=#{origin}&destination=#{destination}&key=#{GOOGLE_API_KEY}")
		response = JSON.parse(request.body)
	rescue

	end

end



# journey planner, interfaces with an external journey planning API,
# returns a plain journey plan


end