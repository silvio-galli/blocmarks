class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @bookmarked_topics = @user.bookmarks.includes(:topic).group_by(&:topic)
    #@liked_bookmarks = @user.liked_bookmarks.includes(:topic).group_by(&:topic)
  end
end
