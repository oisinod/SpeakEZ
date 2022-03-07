class AppointmentsController < ApplicationController

  def show
    @appt = Appointment.find(params[:id])
    @user = current_user
    if @user == @appt.asker
      @partner = @appt.receiver
      @user_language = @appt.asker_language
      @partner_language = @appt.receiver_language
    else
      @partner = @appt.asker
      @user_language = @appt.receiver_language
      @partner_language = @appt.asker_language
    end
    @marker =
      {
        lat: @appt.latitude,
        lng: @appt.longitude
      }

    @markers = [@marker]
    authorize @appt
  end

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
    @appt = Appointment.find(params[:id])
    @receiver = @appt.receiver
    @asker = current_user
    @r_user_languages = @receiver.user_languages
    @a_user_languages = @asker.user_languages
    authorize @appt
  end

  def update
    @appt = Appointment.find(params[:id])
    if params[:q].nil?
      @appt.update(appt_params)
    else
      params[:q].to_i == 1 ? @appt.status = "confirmed" : @appt.status = "declined"
    end
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
