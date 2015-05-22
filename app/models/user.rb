class User < ActiveRecord::Base

	has_secure_password
	
	has_many :favorite_books
	has_many :books, :through => :favorite_books

	has_many :favorite_authors
	has_many :authors, :through => :favorite_authors
	
	validates :username, :uniqueness => true, :allow_nil => false
	validates :email, :uniqueness => true, :allow_nil => false
  	validates :password, :presence => true

end
