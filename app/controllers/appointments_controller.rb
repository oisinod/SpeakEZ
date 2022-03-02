class AppointmentsController < ApplicationController

  def new
    @receiver = User.find(params[:user_id])
    @appt = Appointment.new
    authorize @appt
  end

  def create
    @appt = Appointment.new(appt_params)
    @appt.receiver = User.find(params[:user_id])
    @appt.asker = current_user
    if @appt.save!
    #needs to be changed to dashboard once that path excists!
      redirect_to user_path(@appt.receiver)
    else
      render :new
    end
    authorize @appt
  end

  private

  def appt_params
    params.require(:appointment).permit(:location, :datetime)
  end
end
