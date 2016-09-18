class Post < ApplicationRecord
  belongs_to :board
  has_many :comments, :dependent => :destroy
end
