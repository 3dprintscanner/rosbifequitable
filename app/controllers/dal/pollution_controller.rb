class Dal::PollutionController < ApplicationController
	def index
		@output = "This is the output of the pollution controller"

		render :json => @output
	end
end
