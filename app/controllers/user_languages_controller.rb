class UserLanguagesController < ApplicationController
  def new
    @user_language = UserLanguage.new
    @user_language.user = User.find(params[:user_id])
    authorize @user_language
  end

  def create
    @user_language = UserLanguage.new(user_language_params)
    @user_language.user = current_user
    authorize @user_language
    if @user_language.save
      redirect_to user_path(current_user)
    else
      render :new # .html.erb JUST THE HTML , NOT THE ACTION
    end
  end

  private

  def user_language_params
    params.require(:user_language).permit(:skill_level, :language_id, :learning)
  end
end
