class AppointmentsController < ApplicationController

  def new
    @receiver = User.find(params[:user_id])
    @asker = current_user
    # @r_languages = @receiver.languages
    # @a_languages = @asker.languages
    @appt = Appointment.new
    authorize @appt
  end

  def create
    @appt = Appointment.new(appt_params)
    # @appt.receiver = User.find(params[:user_id])
    # @appt.asker = current_user
    if @appt.save!
    #needs to be changed to dashboard once that path exists!
      redirect_to user_path(@appt.receiver)
    else
      render :new
    end
    authorize @appt
  end

  def update
    @appt = Appointment.find(params[:id])
    params[:q].to_i == 1 ? @appt.status = "confirmed" : @appt.status = "declined"
    @appt.save!
    redirect_to dashboard_path
    authorize @appt
  end

  private

  def appt_params
    params.require(:appointment).permit(:location, :datetime, :status)
  end
end
