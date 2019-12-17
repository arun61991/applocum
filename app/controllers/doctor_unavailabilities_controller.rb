class DoctorUnavailabilitiesController < ApplicationController
  before_action :set_doctor_unavailability, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_doctor!
  # GET /doctor_unavailabilities
  # GET /doctor_unavailabilities.json
  def index
    @doctor_unavailabilities = current_doctor.doctor_unavailabilities.all
  end

  # GET /doctor_unavailabilities/1
  # GET /doctor_unavailabilities/1.json
  def show
  end

  # GET /doctor_unavailabilities/new
  def new
    @doctor_unavailability = DoctorUnavailability.new
  end

  # GET /doctor_unavailabilities/1/edit
  def edit
  end

  # POST /doctor_unavailabilities
  # POST /doctor_unavailabilities.json
  def create
    @doctor_unavailability = DoctorUnavailability.new(doctor_unavailability_params)
    @doctor_unavailability.doctor_id = current_doctor.id
    respond_to do |format|
      if @doctor_unavailability.save
        format.html { redirect_to doctor_unavailabilities_path, notice: 'Doctor unavailability was successfully created.' }
        format.json { render :show, status: :created, location: @doctor_unavailability }
      else
        format.html { render :new }
        format.json { render json: @doctor_unavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doctor_unavailabilities/1
  # PATCH/PUT /doctor_unavailabilities/1.json
  def update
    respond_to do |format|
      if @doctor_unavailability.update(doctor_unavailability_params)
        format.html { redirect_to doctor_unavailabilities_path, notice: 'Doctor unavailability was successfully updated.' }
        format.json { render :show, status: :ok, location: doctor_unavailabilities_path }
      else
        format.html { render :edit }
        format.json { render json: @doctor_unavailability.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doctor_unavailabilities/1
  # DELETE /doctor_unavailabilities/1.json
  def destroy
    @doctor_unavailability.destroy
    respond_to do |format|
      format.html { redirect_to doctor_unavailabilities_url, notice: 'Doctor unavailability was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_doctor_unavailability
      @doctor_unavailability = DoctorUnavailability.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def doctor_unavailability_params
      params.fetch(:doctor_unavailability).permit(:start_date, :end_date, :doctor_id)
    end
end
