class CommentsController < ApplicationController

	before_action :require_user, :only => [:new, :create]
	before_action :authorize, :only => [:edit, :update, :destroy]

	def require_user
		if session[:user_id].blank?
			redirect_to book_url(params[:book_id]), notice: 'You must be signed in to leave a comment.'
		end
	end

	def authorize
		@user = User.find_by_id(params[:user_id])
		if @user.blank? || session[:user_id] != @user.id
			redirect_to comment_url(params[:comment_id]), :notice => 'Not authorized!'
		end
	end

	def index
		@comments = Book.find_by_id(params[:book_id]).comments.order('id DESC')
		if @comments.blank?
			redirect_to book_url(params[:book_id]), :notice => 'There are no comments about this book yet.'
		end
	end

	def show
		@comment = Comment.find_by_id(params[:comment_id])
	end

	def new
		@book = Book.find_by_id(params[:book_id])
		@comment = Comment.new
	end

	def create
		book_id = params[:book_id].to_i
		@new_comment = Comment.new(user_id: session['user_id'], book_id: book_id, text: params[:comment], date: Date.today)
		if @new_comment.save
			redirect_to "/books/#{book_id}/comments"
		else
			redirect_to new_comment_url(book_id)
		end
	end

	def edit
		@comment = Comment.find_by_id(params[:comment_id])
	end

	def update
		comment = Comment.find_by_id(params[:comment_id])
		comment.text = params[:comment]
		comment.save
		redirect_to "/books/#{comment.book.id}/comments"
	end

	def destroy
		comment = Comment.find_by_id(params[:comment_id])
		book_id = comment.book.id
		comment.destroy
		if Book.find_by_id(book_id).comments.count > 0 
			redirect_to "/books/#{book_id}/comments"
		else
			redirect_to "/books/#{book_id}"
		end
	end
	
end