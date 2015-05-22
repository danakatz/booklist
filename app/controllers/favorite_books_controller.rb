class FavoriteBooksController < ApplicationController

	before_action :require_user
	before_action :authorize, :only => [:index]


	def require_user
		if session[:user_id].blank?
			redirect_to login_url, :notice => 'You must be signed in to view or edit your Favorite Books.'
		end
	end

	def authorize
		@user = User.find_by_id(params[:user_id])
		if @user.blank? || session[:user_id] != @user.id
			redirect_to books_url, :notice => "You're not authorized to view that page."
		end
	end

	def index
		@favorite_books = User.find_by_id(session['user_id']).books
	end

	def create
		favorite_book = FavoriteBook.new(user_id: session['user_id'], book_id: params['book_id'])
		favorite_book.save
		redirect_to book_url(params[:book_id])
	end

	def destroy
		favorite_book = FavoriteBook.find_by(user_id: session['user_id'], book_id: params['book_id'])
		favorite_book.delete
		redirect_to book_url(params[:book_id])
	end

end