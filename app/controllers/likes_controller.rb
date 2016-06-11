class LikesController < ApplicationController
  def create
    bookmark = Bookmark.find(params[:bookmark_id])
    like = bookmark.likes.new
    like.user = current_user
    if like.save
      flash[:notice] = "You've just liked a bookmark."
      redirect_to topic_path(bookmark.topic_id)
    else
      flash[:alert] = "Your like was NOT registered. Please try again."
      redirect_to topic_path(bookmark.topic_id)
    end
  end

  def destroy
    bookmark = Bookmark.find(params[:bookmark_id])
    like = Like.find(params[:id])
    if like.destroy
     flash[:notice] = "Bookmark unliked."
     redirect_to topic_path(bookmark.topic_id)
    else
     flash[:alert] = "Unliking failed."
     redirect_to topic_path(bookmark.topic_id)
    end
  end
end
