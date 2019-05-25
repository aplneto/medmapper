class MaternityClinicsController < ApplicationController
  before_action :set_maternity_clinic, only: [:show, :edit, :update, :destroy]

  # GET /maternity_clinics
  # GET /maternity_clinics.json
  def index
    @maternity_clinics = MaternityClinic.all
  end

  # GET /maternity_clinics/1
  # GET /maternity_clinics/1.json
  def show
  end

  # GET /maternity_clinics/new
  def new
    @maternity_clinic = MaternityClinic.new
  end

  # GET /maternity_clinics/1/edit
  def edit
  end

  # POST /maternity_clinics
  # POST /maternity_clinics.json
  def create
    @maternity_clinic = MaternityClinic.new(maternity_clinic_params)

    respond_to do |format|
      if @maternity_clinic.save
        format.html { redirect_to @maternity_clinic, notice: 'Maternity clinic was successfully created.' }
        format.json { render :show, status: :created, location: @maternity_clinic }
      else
        format.html { render :new }
        format.json { render json: @maternity_clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /maternity_clinics/1
  # PATCH/PUT /maternity_clinics/1.json
  def update
    respond_to do |format|
      if @maternity_clinic.update(maternity_clinic_params)
        format.html { redirect_to @maternity_clinic, notice: 'Maternity clinic was successfully updated.' }
        format.json { render :show, status: :ok, location: @maternity_clinic }
      else
        format.html { render :edit }
        format.json { render json: @maternity_clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /maternity_clinics/1
  # DELETE /maternity_clinics/1.json
  def destroy
    @maternity_clinic.destroy
    respond_to do |format|
      format.html { redirect_to maternity_clinics_url, notice: 'Maternity clinic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_maternity_clinic
      @maternity_clinic = MaternityClinic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def maternity_clinic_params
      params.require(:maternity_clinic).permit(:health_unit_id, :type)
    end
end
