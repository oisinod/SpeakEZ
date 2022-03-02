class DashboardController < ApplicationController
  skip_after_action :verify_authorized
  
  def show
    @user = current_user
    @outgoing = current_user.appointments_as_asker
    @incoming = current_user.appointments_as_receiver
    # @review = Review.new
  end
end
