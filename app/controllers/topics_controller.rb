class TopicsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def create
    @topic = Topic.new
    authorize @topic
    @topic.title = params[:topic][:title]
    @topic.user = current_user
    @topic
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
    authorize @topic
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    @topic.title = params[:topic][:title]
    if @topic.save
      flash[:notice] = "Topic successfully updated!"
      redirect_to topic_path(@topic)
    else
      flash[:alert] = "Topic not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was successfully deleted."
      redirect_to topics_path
    else
      flash[:alert] = "Topic was NOT deleted. Please try again."
      render :show
    end
  end
end
