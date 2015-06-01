class AuthorsController < ApplicationController

  def show
    @books = Author.find_by_id(params[:author_id]).books.order('title')
  end

end