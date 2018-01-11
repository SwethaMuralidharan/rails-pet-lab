class AppointmentsController < ApplicationController
  def new
    @app=Appointment.new
  end
  def create
    @app = Appointment.new(appointment_params)
    pet_id = params[:pet_id]
    @app.pet=Pet.find_by(id:pet_id)
    if @app.save
      redirect_to pet_path(pet_id)
    else
      flash[:error]=@app.errors.full_messages.join(", ")
      redirect_to new_pet_appointment_path(@app.pet)
    end
  end

  private
  def appointment_params
    params.require(:appointment).permit(:veterinarian, :reason, :time)
  end
end
