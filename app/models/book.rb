class Book < ActiveRecord::Base

	belongs_to :author
	has_many :book_comments
	has_many :reviews

end
