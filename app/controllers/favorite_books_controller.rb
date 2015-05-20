class FavoriteBooksController < ApplicationController

	def index
		@favorite_books = User.find_by_id(cookies['user_id']).books
	end

	def create
		favorite_book = FavoriteBook.new(user_id: cookies['user_id'], book_id: params['book_id'])
		favorite_book.save
		redirect_to book_url(params[:book_id])
	end

	def destroy
		favorite_book = FavoriteBook.find_by(user_id: cookies['user_id'], book_id: params['book_id'])
		favorite_book.delete
		redirect_to book_url(params[:book_id])
	end

end