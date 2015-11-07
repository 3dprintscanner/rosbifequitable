class UiController < ApplicationController

	@returnData = {}
	def getCycleData(params)
		case params[:type]

		when 'location'
			@returnData = CycleReference.getCycleDataByLocation(params)
		when 'time'
			@returnData = CycleReference.getCycleDataByTime(params)
		when 'interval' 
			@returnData = CycleReference.getCycleDataByInterval(params)
		else
			@returnData = "unknown"
			
		end

		render :json => @returnData

	end

	def planJourney

		journey = JourneyPlanner.plan(params[:origin], params[:destination])

		render :json => journey
	end

	def getParkingData(params)

	end

	def getPollutionData(params)

	end

	def planBasicRoute(params)

	end

	def planFilteredRoute(params)

	end
end
