class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @user = current_user
    if params[:language].present?
      # Gets the object of the actual language here
      @language = Language.where(name: params[:language])
      # Now gets the user languages who have this language
      @user_language = UserLanguage.where(language: @language)
      # Now you should return each user associated with the above active record relation
      @users = @user_language.map do |language|
        language.user
      end
    else
      @users = User.all
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
