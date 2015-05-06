class Topic < ActiveRecord::Base

	has_many :subjects
	has_many :articles, :through => :subjects

end
