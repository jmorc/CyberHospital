class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :new, :update, :destroy]
  before_action :authenticate_user!
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
    if @item.update(item_params)
      flash[:notice] = 'Patient Data updated'
      redirect_to @item.patient
    else
      flash[:notice] = @item.errors.full_messages
      redirect_to @item.patient
    end

  end

  def destroy
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
  end

  private

    def set_item
        @item = Item.find(params[:id])
    end
  
    def item_params
      params.require(:item).permit(:name, :value, :comment, :patient_id)
    end

end
