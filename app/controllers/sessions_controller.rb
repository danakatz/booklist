class SessionsController < ApplicationController

	def create
		if params[:username].blank? || params[:password].blank?
			render 'new', notice: "Please enter a username and password."
		else
			user = User.find_by(username: params[:username])
			if user
				if user.password == params[:password]
					cookies['user_id'] = user.id
					redirect_to root_url, notice: "Welcome, #{user.username}!"
				else
					redirect_to login_url, notice: "Username and password don't match."
				end
			else
				redirect_to login_url, notice: "No such user."
			end
		end
	end

	def destroy
		cookies.delete 'user_id'
		redirect_to login_url, notice: "You've been signed out."
	end

end
