class PatientDataController < ApplicationController
  def create
  end

  def update
    @patient_data = PatientData.find(params[:id])
    
    if @patient_data.update(patient_data_params)
      redirect_to @patient_data.patient
    else
      flash[:errors] = @patient_data.errors.full_messages
      redirect_to @patient_data.patient
    end

  end

  def destroy
  end

  def show
  end

  def new
  end

  def edit
    @patient_data = PatientData.find(params[:id]) 
  end

  private

  def patient_data_params
    params.require(:patient_data).permit(:name, :value, :comment)
  end

end
