class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @user_languages = @user.user_languages
  end

  def dashboard
    @user = current_user
    @outgoing = current_user.appointments_as_asker
    @incoming = current_user.appointments_as_receiver
    # @review = Review.new
  end
end
