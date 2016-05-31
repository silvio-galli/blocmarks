class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    # Find the user by using params[:sender]
    user = User.find_by(email: params[:sender])
    # Check if user is nil
    if user.nil?
      # TODO some actions to take if user is nil
      # e.i. send back an email
    end

    # Find the topic by using params[:subject]
    if params[:subject] == ""                             # if topic is empty string
      topic = Topic.find_or_create_by(title: "no topic")  # topic is assigned to "no topic"
    else
      topic = Topic.find_or_create_by(title: params[:subject].downcase, user: user)
    end

    email_body = params["body-plain"]               # assign params["body-plain"] to a variable
    body_strings = email_body.split(/\r\n/)         # split the variable based on carriage return
    if body_strings.count > 1                       # if the resulting array as more than one element
      url = body_strings[0]                         # assign the first line to url
      description = body_strings[1]                 # the second line to description
    else                                            # if only one line is present in the email body
      url = params["body-plain"]                    # this is assigned to url, and assign something to description
      description = "sent from email, no description provided"
    end

    bookmark = topic.bookmarks.build(                 # Now that you're sure you have a valid user and topic, build and save a new bookmark
      url: url,
      description: description,
      user_id: user.id
    )
    if bookmark.save
      # Assuming all went well.
      head 200
      # TODO implement sending email to confirm everything went well
    else
      head 400
      # TODO implement sending email to inform something went wrong
    end
  end

end
