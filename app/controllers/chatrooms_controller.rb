class ChatroomsController < ApplicationController
  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
    @user = current_user
    authorize @chatroom
  end

  def create
    @chatrooms = Chatroom.all
    @chatroom = Chatroom.new
    @chatroom.users << current_user
    @chatroom.save
    @chatroom.users << User.find(params[:user_id])
    if @chatroom.save
      redirect_to @chatroom
    end
    authorize @chatroom
  end
end
