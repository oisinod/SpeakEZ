class UsersController < ApplicationController
  def index
    @users = policy_scope(User).where.not(id: current_user.id)
    @user = current_user
    if params[:language].present?
      @language = Language.find_by(name: params[:language])
      #gets the instances of the user languages, will then filter by who is learning it or not
      @user_languages = @language.user_languages
      # have all the users which have this language as a user language, now i need to filter by the ones that have learning as false
      @users = @user_languages.where(learning: false).map {|user_language| user_language.user} unless @user_languages.nil?
    end

    if params[:search].present?
      if params[:search][:user_language] == ""
        @users = User.where.not(id: current_user.id)
      else
        @language = Language.find_by(name: params[:search][:user_language].split(" ")[1])
        #gets the instances of the user languages, will then filter by who is learning it or not
        @user_languages = @language.user_languages
        # have all the users which have this language as a user language, now i need to filter by the ones that have learning as false
        @users = @user_languages.map {|user_language| user_language.user} unless @user_languages.nil?
      end
    end

    @markers = @users.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "users/index/info_window", locals: { user: user })
      }
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
    @learning = @user.user_languages.where(learning: true)
    @speaking = @user.user_languages.where(learning: false)
  end
end
