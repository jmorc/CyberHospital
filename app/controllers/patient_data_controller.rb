class PatientDataController < ApplicationController
  def create
    @patient = Patient.find(params[:patient_data][:patient_id])
    @patient_data = @patient.patient_datas.new(patient_data_params)

    if @patient_data.save!
      flash[:notice] = 'New Patient Data Saved'
      redirect_to @patient_data.patient
    else
      flash[:notice] = @patient_data.errors.full_messages
      redirect_to @patient_data.patient
    end

  end

  def update
    @patient_data = PatientData.find(params[:id])
    
    if @patient_data.update(patient_data_params)
      flash[:notice] = 'Patient Data updated'
      redirect_to @patient_data.patient
    else
      flash[:notice] = @patient_data.errors.full_messages
      redirect_to @patient_data.patient
    end

  end

  def destroy
    @patient_data = PatientData.find(params[:id])
    @patient_data.destroy
    redirect_to @patient_data.patient
  end

  def show
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @patient_data = PatientData.new
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @patient_data = PatientData.find(params[:id]) 
  end

  private

  def patient_data_params
    params.require(:patient_data).permit(:name, :value, :comment, :patient_id)
  end

end
