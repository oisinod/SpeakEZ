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
    @chatroom.save
    authorize @chatroom
  end
end
