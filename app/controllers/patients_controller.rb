class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  respond_to :html

  def show
    respond_with(@patient)
  end

  def new
    @patient = Patient.new
    @clinic = Clinic.find(params[:clinic_id])
  end

  def edit
    @clinic = @patient.clinic
  end

  def create
    @clinic = Clinic.find(params[:clinic_id])
    @patient = @clinic.patients.new(patient_params)
    if @patient.save
      redirect_to @clinic
    else
      flash[:notices] = @patient.errors.full_messages
      render :new
    end
  end

  def update
    @patient.update(patient_params)
    respond_with(@patient)
  end

  def destroy
    @patient.destroy
    respond_with(@patient)
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :summary, :temperature, :heart_rate)
    end
end
