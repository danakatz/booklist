class Book < ActiveRecord::Base

  belongs_to :author
  has_many :comments
  has_many :reviews, :dependent => :destroy

end
