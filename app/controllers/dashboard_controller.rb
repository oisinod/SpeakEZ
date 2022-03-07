class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @user = current_user
    # this is not ideal, but can't figure out a better way atm
    @appts = Appointment.all
  end
end
