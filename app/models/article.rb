class Article < ActiveRecord::Base

	belongs_to :author
	belongs_to :publication
	belongs_to :section

	has_many :subjects
	has_many :topics, :through => :subjects
	
end
