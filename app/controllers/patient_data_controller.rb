class PatientItemsController < ApplicationController
  load_and_authorize_resource

  def create
    @patient = Patient.find(params[:patient_item][:patient_id])
    @patient_item = @patient.patient_items.new(patient_items_params)

    if @patient_item.save!
      flash[:notice] = 'New Patient Data Saved'
      redirect_to @patient_item.patient
    else
      flash[:notice] = @patient_item.errors.full_messages
      redirect_to @patient_item.patient
    end

  end

  def update
    @patient_item = PatientItem.find(params[:id])
    
    if @patient_item.update(patient_item_params)
      flash[:notice] = 'Patient Data updated'
      redirect_to @patient_item.patient
    else
      flash[:notice] = @patient_item.errors.full_messages
      redirect_to @patient_item.patient
    end

  end

  def destroy
    @patient_item = PatientItem.find(params[:id])
    @patient_item.destroy
    redirect_to @patient_item.patient
  end

  def show
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @patient_item = PatientItem.new
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @patient_item = PatientItem.find(params[:id]) 
  end

  private

  def patient_items_params
    params.require(:patient_item).permit(:name, :value, :comment, :patient_id)
  end

end
