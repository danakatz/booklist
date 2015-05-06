class Subject < ActiveRecord::Base

	belongs_to :topic
	belongs_to :article
	
end
