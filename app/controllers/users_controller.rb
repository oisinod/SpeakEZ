class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    authorize @user
    if params[:search].present?
      @users = User.global_search(params[:search][:query])
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
