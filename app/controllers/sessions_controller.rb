class SessionsController < ApplicationController

  def create
    if params[:username].blank? || params[:password].blank?
      render 'new', notice: "Please enter a username and password."
    else
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session['user_id'] = user.id
        redirect_to root_url, notice: "Welcome, #{user.username}!"
      else
        redirect_to login_url, notice: "Uh oh. Invalid username and/or password."
      end
    end
  end

  def destroy
    session.delete 'user_id'
    redirect_to login_url, notice: "You've been signed out."
  end

end
