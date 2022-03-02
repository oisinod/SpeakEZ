class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @user = current_user
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
