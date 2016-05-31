class Bookmark < ActiveRecord::Base
  belongs_to :bookmark
  belongs_to :user
  has_many :likes
end
