class MessagesController < ApplicationController
before_action :logged_in_user, only: [:create,:destroy]

  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatrooms_channel",
      mod_message: message_render(message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end

end
