class CommentsController < ApplicationController

	def index
		@comments = Comment.all
	end

	def show
		@comment = Comment.find_by_id(params[:id])
		puts @comment.article_id
		@user = User.find_by_id(@comment.user_id)
		@article = Article.find_by_id(@comment.article_id)
	end

	def new
	end

	def create
		comment = Comment.new
		comment.user_id = User.first.id
		comment.article_id = Article.first.id
		comment.text = params[:comment]
		comment.save
		redirect_to "/comments"
	end

	def edit
		@comment = Comment.find_by_id(params[:id])
	end

	def update
		comment = Comment.find_by_id(params[:id])
		comment.text = params[:comment]
		comment.save
		redirect_to comments_url
	end

	def destroy
	end
	
end