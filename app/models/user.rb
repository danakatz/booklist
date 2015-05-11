class User < ActiveRecord::Base

	has_many :favorite_books
	has_many :books, :through => :favorite_books

	has_many :favorite_authors
	has_many :authors, :through => :favorite_authors
	
end
