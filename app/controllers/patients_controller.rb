class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def show
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
      flash[:notices] = "Patient created"
      redirect_to @clinic
    else
      flash[:notices] = @patient.errors.full_messages
      render :new
    end
  end

  def update
    if @patient.update(patient_params)
      flash[:notices] = "Patient updated"
    else
      flash[:notices] = @patient.errors.full_messages
    end
    redirect_to @patient
  end

  def destroy
    @patient.destroy
    redirect_to @patient.clinic
  end

  
  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:name, :summary, :viewable_time)
    end
end
