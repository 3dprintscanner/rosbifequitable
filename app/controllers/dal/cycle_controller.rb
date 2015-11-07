class Dal::CycleController < ApplicationController

	require 'pry'
	protect_from_forgery with: :null_session

	def update
		@output = "called the update page"

		render :json => @output
	end

	def index
		@output = "called the cycle index page"

		render :json => @output
	end

	def create
		# this method creates a new update for a cycle station


	end

	def querydata()

	end

	def cycledata
		# Get the params from the request and run these into the model
		# binding.pry
		if !params[:cycle]
			render :json => "error, please POST to this endpoint"
			return
		end
		@cycleparams = JSON.parse(request.body.read)
		CycleReference.updateData(@cycleparams)
		render :html => "success"
	end

	private 
	def cycle_params
      params.require(:cycle).permit(:name)
    end
end
