class ReviewsController < ApplicationController

	def index
		@book = Book.find_by_id(params[:id])
		@reviews = @book.reviews
	end

end