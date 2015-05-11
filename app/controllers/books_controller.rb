class BooksController < ApplicationController

    def index
        @books = Book.where(current: true).order('rank')
    end

    def show
        @book = Book.find_by_id(params[:id])
    end

end