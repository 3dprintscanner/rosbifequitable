class DalController < ApplicationController

	def index
		@output = "called the output page"

		render :json => @output

	end

end
