class BookmarksController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(bookmarks_params)
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark saved!"
      redirect_to topics_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:url, :description)
  end
end
