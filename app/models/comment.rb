class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :book

  validates :user_id, :presence => true
  validates :text, :presence => true

end
