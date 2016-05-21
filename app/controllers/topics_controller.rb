class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new
    @topic[:title] = params[:topic][:title]
    if @topic.save
      flash[:notice] = "Topic successfully created!"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Topic was not created. Please try again."
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    @topic[:title] = params[:topic][:title]
    if @topic.save
      flash[:notice] = "Topic successfully updated!"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Topic not updated. Please try again."
      render :edit
    end
  end
end
