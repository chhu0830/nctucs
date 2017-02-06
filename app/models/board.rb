class Board < ApplicationRecord
  belongs_to :category
  has_many :posts, :dependent=>:destroy
	has_many :viewlists, :dependent=>:delete_all
	has_many :users, :through=>:viewlists
end
