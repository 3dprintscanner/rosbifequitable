class Dal::ParkingController < ApplicationController

	def parkingdata
		# Get the params from the request and run these into the model
		# binding.pry
		if !params[:parking]
			render :json => "error, please POST to this endpoint"
			return
		end
		@parkingparams = JSON.parse(request.body.read)
		ParkingReference.updateData(@parkingparams)
		render :html => "success"
		end

end
