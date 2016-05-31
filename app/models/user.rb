class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :topics
  has_many :bookmarks
  has_many :likes

  def liked?(bookmark)
    bookmark.likes.where(user_id: id).any?
  end
end
