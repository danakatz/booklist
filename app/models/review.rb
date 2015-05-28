class Review < ActiveRecord::Base

    belongs_to :reviewer
    belongs_to :book

    has_many :review_comments

end
