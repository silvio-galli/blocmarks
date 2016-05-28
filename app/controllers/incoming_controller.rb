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

    email_body = params["body-plain"]                 # assign params["body-plain"] to a variable
    body_strings = email_body.split(/\r\n/)           # split the variable based on carriage return
    if body_strings.count != 0                        # if the resulting array as more than one element
      url = body_strings[0]                           # assign the first line to url
      description = body_strings[1]                   # the second line to description
    else                                              # if only one line is present in the email body
      url = params["body-plain"]                      # this is assigned to url, and assign something to description
      description = "sent from email, no description provided"
    end

    bookmark = topic.bookmarks.build(                 # Now that you're sure you have a valid user and topic, build and save a new bookmark
      url: url,
      description: description,
      user_id: user.id
    )
    bookmark.save

    # Assuming all went well.
    head 200
  end

end