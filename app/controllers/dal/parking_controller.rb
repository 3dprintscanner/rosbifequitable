class Dal::ParkingController < ApplicationController

	protect_from_forgery with: :null_session
	def parkingdata
		# Get the params from the request and run these into the model
		# binding.pry
		if !params[:parking]
			render :json => "error, please POST to this endpoint"
			return
		end
		@parkingparams = JSON.parse(request.body.read)
		ref = ParkingReference.updateData(@parkingparams)
	 	if ref
		render :html => "success"
		else
			render :html => "failure"
		end
	end

end
