class MessagesController < ApplicationController
  def create
    @message = Message.new(strong_params)
    @chatroom = Chatroom.find params[:chatroom_id]
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save
      # broadcast to the channel
      ChatroomChannel.broadcast_to(
        @chatroom,
        # the message as HTML
        render_to_string(
          partial: 'messages/message',
          locals: { message: @message }
        )
      )
      head :ok # respond with a 200 STATUS

      # redirect_to chatroom_path(@chatroom.id, anchor: "message-#{@message.id}")
    else
      render 'chatrooms/show'
    end
  end

  private

  # filter what comes from the form
  def strong_params
    params.require(:message)
          .permit(:content)
  end
end
