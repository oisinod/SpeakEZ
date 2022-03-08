class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    authorize @chatroom
  end

  def create
    @chatroom = Chatroom.new
    current_user.chatrooms << @chatroom
    User.find(params[:user_id]).chatrooms << @chatroom
    authorize @chatroom
    if @chatroom.save
      redirect_to @chatroom
    else
      render "users/show"
    end
  end
end
