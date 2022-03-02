class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @user = current_user
    if params[:language].present?
      @users = Language.find_by(name: params[:language]).users.distinct
      raise
      # Gets the object of the actual language here
      # @language = Language.find_by(name: params[:language])
      # # Now gets the user languages who have this language
      # @user_languages = UserLanguage.where(language: @language)
      # # Now you should return each user associated with the above active record relation
      # @users = @user_languages.map do |language|
      #   language.user
      # end

    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
