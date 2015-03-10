class ItemsController < ApplicationController
  load_and_authorize_resource

  def create
    @patient = Patient.find(params[:item][:patient_id])
    @item = @patient.items.new(item_params)

    if @item.save!
      flash[:notice] = 'New Patient Data Saved'
      redirect_to @item.patient
    else
      flash[:notice] = @item.errors.full_messages
      redirect_to @item.patient
    end

  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      flash[:notice] = 'Patient Data updated'
      redirect_to @item.patient
    else
      flash[:notice] = @item.errors.full_messages
      redirect_to @item.patient
    end

  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to @item.patient
  end

  def show
  end

  def new
    @patient = Patient.find(params[:patient_id])
    @item = Item.new
  end

  def edit
    @patient = Patient.find(params[:patient_id])
    @item = Item.find(params[:id]) 
  end

  private

  def item_params
    params.require(:item).permit(:name, :value, :comment, :patient_id)
  end

end
