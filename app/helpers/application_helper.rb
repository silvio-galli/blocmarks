module ApplicationHelper
  def retrieve_like_from_bookmark(bookmark)
    current_user.likes.where(bookmark_id: bookmark).take
  end
end
