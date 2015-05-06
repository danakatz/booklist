class Section < ActiveRecord::Base

	belongs_to :publication
	has_many :articles
	
end
