class UserLanguagesController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @user_language = UserLanguage.new
    @user_language.user = @user
    authorize @user_language
  end

  def create
    @user_language = UserLanguage.new(user_language_params)
    @user_language.user = current_user
    @user_language.language = Language.find(params[:user_language][:language_id])
    authorize @user_language
    if @user_language.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  private

  def user_language_params
    params.require(:user_language).permit(:skill_level, :language_id)
  end
end
