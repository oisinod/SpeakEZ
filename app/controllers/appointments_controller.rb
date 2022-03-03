class AppointmentsController < ApplicationController

  def new
    @receiver = User.find(params[:user_id])
    @asker = current_user
    @r_user_languages = @receiver.user_languages
    @a_user_languages = @asker.user_languages
    @appt = Appointment.new
    authorize @appt
  end

  def create
    @appt = Appointment.new(appt_params)
    if @appt.save!
      redirect_to user_path(@appt.receiver)
    else
      render :new
    end
    authorize @appt
  end

  def edit
  end

  def update
    @appt = Appointment.find(params[:id])
    params[:q].to_i == 1 ? @appt.status = "confirmed" : @appt.status = "declined"
    @appt.save!
    redirect_to dashboard_path
    authorize @appt
  end

  def destroy
    @appt = Appointment.find(params[:id])
    @appt.destroy
    redirect_to dashboard_path
    authorize @appt
  end

  private

  def appt_params
    params.require(:appointment).permit(:location, :datetime, :status, :asker_language_id, :receiver_language_id)
  end
end
