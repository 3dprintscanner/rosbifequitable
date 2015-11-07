class Dal::CycleController < ApplicationController

	def update
		@output = "called the update page"

		render :json => @output
	end

	def index
		@output = "called the cycle index page"

		render :json => @output
	end
end
