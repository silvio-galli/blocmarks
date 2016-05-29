class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def new
    @topic = Topic.find(params[:topic_id])
    @bookmark = Bookmark.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = @topic.bookmarks.create(bookmarks_params)
    authorize @bookmark
    @bookmark.user = current_user

    if @bookmark.save
      flash[:notice] = "Bookmark saved!"
      redirect_to topics_path
    else
      flash[:alert] = "Something went wrong. Please try again."
      render :new
    end
  end

  def show
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    @bookmark.assign_attributes(bookmarks_params)

    if @bookmark.save
      flash[:notice] = "Bookmark successfully  updated!"
      redirect_to bookmark_path(@bookmark)
    else
      flash[:alert] = "Bookmark NOT updated. Please try again."
      render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark
    if @bookmark.destroy
      flash[:notice] = "Bookmark was successfully deleted!"
      redirect_to topic_path(@bookmark.topic)
    else
      flash[:alert] = "Bookmark was NOT deleted. Please try again."
      render :show
    end
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:url, :description)
  end
end
