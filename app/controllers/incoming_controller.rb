class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    user = User.find(params[:sender])
    # Find the topic by using params[:subject]
    topic = Topic.find(params[:subject])
    # Assign the url to a variable after retreiving it from params["body-plain"]
    url = params["body-plain"].strip

    # Check if user is nil, if so, create and save a new user
    if user == nil
      # some actions to take if user is nil
      # e.i. send back an email

    # Check if the topic is nil, if so, create and save a new topic
    elsif
      bookmark = Bookmark.new
      bookmark.url = url
      bookmark.user = user
      # i topic == nil
      # assign topic = "no topic"
      if topic == nil
        topic = Topic.where(title: "no topic")
        bookmark.topic_id = topic.id
      else
        bookmark.topic = topic
      end

      # Now that you're sure you have a valid user and topic, build and save a new bookmark
      bookmark.save

      # Assuming all went well.
      head 200
    end
  end

end
