class DashboardController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @user = current_user
    # this is not ideal, but can't figure out a better way atm
    @appts = Appointment.all
    # @outgoing = current_user.appointments_as_asker
    # @incoming = current_user.appointments_as_receiver
    # @review = Review.new
  end
end
