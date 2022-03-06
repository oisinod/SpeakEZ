class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @user = current_user
    @user_languages = @user.user_languages if @user
  end

  def test
    @current_user = current_user
    start_date = params.fetch(:start_date, Date.today).to_date
    @appts = Appointment.all
    @my_appts = @appts.map do |appt|
     ( appt.asker == current_user || appt.receiver == current_user) ? appt : next
    end
    @my_appts.compact!
    @meetings = Appointment.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end
end
