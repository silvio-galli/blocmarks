class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    user = User.find_by(email: params[:sender])
    # Check if user is nil
    if user == nil || user == []
      # some actions to take if user is nil
      # e.i. send back an email
    end

    # Find the topic by using params[:subject]
    if params[:subject] == ""                         # if params[:subject] is empty
      topic = Topic.where(title: "no topic")          # topic is assigned to "no topic"
    else                                              # if params[:subject] is NOT empty, use it as topic
      topic = Topic.find_by(title: params[:subject])  # assign topic to params[:subject]
      if topic == nil || topic == []                  # if params[:subject] is not a topic already existent, it returns nil or []
        topic = Topic.create(                         # so create a new topic based on params[:subject]
          title: params[:subject],
          user_id: user.id
          )
      end
    end

    url = params["body-plain"]                        # Assign the url to a variable after retreiving it from params["body-plain"]

    bookmark = topic.bookmarks.build(                 # Now that you're sure you have a valid user and topic, build and save a new bookmark
      url: url,
      user_id: user.id
    )
    bookmark.save

    # Assuming all went well.
    head 200
  end

end
