class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new(username: params[:username], email: params[:email], password: params[:password])
		if @user.save
			redirect_to login_url, notice: "Account created successfully! Sign in to get started."
		else
			render "new"
		end
	end
end
