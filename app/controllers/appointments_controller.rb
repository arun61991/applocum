class AppointmentsController < ApplicationController
	before_action :set_appointment, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_patient!, only: [:create, :new, :patient_index]
	before_action :authenticate_doctor!,  :except => [:create, :new, :patient_index]
	

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = current_doctor.appointments.all
  end

  def patient_index
    @appointments = current_patient.appointments.all
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
  	@appointment = Appointment.new(appointment_params)
  	appointment_datetime = (appointment_params["appointment_date(1i)"] + "-" + appointment_params["appointment_date(2i)"] + "-" + appointment_params["appointment_date(3i)"] + " " + appointment_params["appointment_date(4i)"] + ":" + appointment_params["appointment_date(5i)"]).to_datetime
  	doctor = Doctor.find(appointment_params["doctor_patient_id"])
  	if doctor.doctor_unavailabilities.where("start_date <= ? AND end_date >= ?",appointment_datetime,appointment_datetime).present?
  		respond_to do |format|
  			@appointment.errors.add(:name, "Doctor is unavailable")
  			format.html { render :new }
	        format.json { render json: @appointment.errors, status: :unprocessable_entity }
	    end
  	else
	  	doctor_patient = DoctorPatient.create(patient_id: current_patient.id, doctor_id: appointment_params["doctor_patient_id"])
	    @appointment.doctor_patient_id = doctor_patient.id
	    respond_to do |format|
	      if @appointment.save
	        format.html { redirect_to root_path, notice: 'Appointment was successfully created.' }
	        format.json { render :show, status: :created, location: @appointment }
	      else
	        format.html { render :new }
	        format.json { render json: @appointment.errors, status: :unprocessable_entity }
	      end
	    end
	end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:completed, :appointment_date, :doctor_patient_id, :status)
    end
end
