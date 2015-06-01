class FavoriteAuthorsController < ApplicationController

  before_action :require_user
  before_action :authorize, :only => [:index]


  def require_user
    if session[:user_id].blank?
      redirect_to login_url, :notice => 'You must be signed in to view or edit your Favorite Authors.'
    end
  end

  def authorize
    @user = User.find_by_id(params[:user_id])
    if @user.blank? || session[:user_id] != @user.id
      redirect_to books_url, :notice => "You're not authorized to view that page."
    end
  end

  def index
    @favorite_authors = User.find_by_id(session['user_id']).authors
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
