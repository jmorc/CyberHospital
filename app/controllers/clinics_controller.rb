class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def index
    @clinics = Clinic.all
  end

  def show
  end

  def new
    @clinic = Clinic.new
  end

  def edit
  end

  def create
    if @clinic.save!
      flash[:notice] = 'New Clinic Created'
      redirect_to @clinic
    else
      flash[:notice] = @clinic.errors.full_messages
      redirect_to @clinic
    end
  end

  def update
    if @clinic.update(clinic_params)
      flash[:notice] = 'Clinic updated'
    else
      flash[:notice] = @clinic.errors.full_messages
    end
    redirect_to @clinic
  end

  def destroy
    @clinic.destroy
    redirect_to clinics_url
  end

  private
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    def clinic_params
      params.require(:clinic).permit(:name)
    end
end
