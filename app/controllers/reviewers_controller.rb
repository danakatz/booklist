class ReviewersController < ApplicationController

	def show
		@reviewer = Reviewer.find_by_id(params[:id])
		@reviews = @reviewer.reviews
	end

end
