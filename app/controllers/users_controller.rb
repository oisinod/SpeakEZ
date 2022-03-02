class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @user = current_user
    if params[:language].present?
      @language = Language.find_by(name: params[:language])
      #gets the instances of the user languages, will then filter by who is learning it or not
      @user_languages = @language.user_languages
      # have all the users which have this language as a user language, now i need to filter by the ones that have learning as false
      @users = @user_languages.where(learning: false).map do |user_language|
        user_language.user
      end
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end
end
