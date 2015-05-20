class FavoriteAuthorsController < ApplicationController

	def create
		author_id = Book.find_by_id(params[:book_id]).author.id
		favorite_author = FavoriteAuthor.new(user_id: cookies['user_id'], author_id: author_id)
		favorite_author.save
		redirect_to book_url(params[:book_id])
	end

	def destroy
		author_id = Book.find_by_id(params[:book_id]).author.id
		favorite_author = FavoriteAuthor.find_by(user_id: cookies['user_id'], author_id: author_id)
		favorite_author.delete
		redirect_to book_url(params[:book_id])
	end

end
