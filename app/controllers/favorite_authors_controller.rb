class FavoriteAuthorsController < ApplicationController

	def index
		@favorite_authors = User.find_by_id(session['user_id']).authors
	end

	def show
		@books = Author.find_by_id(params[:author_id]).books.order('title')
	end

	def create
		author_id = Book.find_by_id(params[:book_id]).author.id
		favorite_author = FavoriteAuthor.new(user_id: session['user_id'], author_id: author_id)
		favorite_author.save
		redirect_to book_url(params[:book_id])
	end

	def destroy
		author_id = Book.find_by_id(params[:book_id]).author.id
		favorite_author = FavoriteAuthor.find_by(user_id: session['user_id'], author_id: author_id)
		favorite_author.delete
		redirect_to book_url(params[:book_id])
	end

end
