class CommentsController < ApplicationController

	def index
		@comments = Book.find_by_id(params[:book_id]).comments
	end

	def show
		@comment = Comment.find_by_id(params[:id])
	end

	def new
		@book = Book.find_by_id(params[:book_id])
		@comment = Comment.new
	end

	def create
		book_id = params[:book_id].to_i
		@new_comment = Comment.new(user_id: cookies['user_id'], book_id: book_id, text: params[:comment], date: Date.today)
		if @new_comment.save
			redirect_to book_url(book_id)
		else
			redirect_to new_comment_url(book_id)
		end
	end

	def edit
		@comment = Comment.find_by_id(params[:id])
	end

	def update
		comment = Comment.find_by_id(params[:id])
		comment.text = params[:comment]
		comment.save
		redirect_to "/books/#{comment.book.id}/comments"
	end

	def destroy
		comment = Comment.find_by_id(params[:id])
		book_id = comment.book.id
		comment.delete
		if Book.find_by_id(book_id).comments.count > 0 
			redirect_to "/books/#{book_id}/comments"
		else
			redirect_to "/books/#{book_id}"
		end
	end
	
end