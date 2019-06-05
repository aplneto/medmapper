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
    redirect_to controller: 'health_units', action: 'show',
    id: @maternity_clinic.id
  end

  # GET /maternity_clinics/new
  def new
    redirect_to controller: 'health_units', action: 'new',
    health_unit: MaternityClinic.new
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
  
  def basic_search
    if params[:keywords].empty?
      redirect_to maternity_clinics_path
    else
      @maternity_clinics = MaternityClinic.where("specialties && :kw or 
        treatments && :kw", kw: params[:keywords].split(' '))
      respond_to do |format|
        format.html { render template: "maternity_clinics/index.html.slim" }
        format.json { render template: "maternity_clinics/index.json.jbuilder"}
      end
    end
  end
  
  def list_by_specialties
    if params[:specialty].nil?
      redirect_to maternity_clinics_path
    else
      @specialty = params[:specialty]
      @maternity_clinics = MaternityClinic.where("specialties && ARRAY[?]",
        @specialty)
      respond_to do |format|
        format.html { render template: "maternity_clinics/specialty.html.slim" }
        format.json { render template: "maternity_clinics/index.json.jbuilder"}
      end
    end
  end
  
  def list_by_treatments
    if params[:treatments].empty?
      redirect_to maternity_clinics_path
    else
      @maternity_clinics = MaternityClinic.where("treatments && ?",
        params[:treatments].split(' '))
      respond_to do |format|
        format.html { render template: "maternity_clinics/index.html.slim" }
        format.json { render template: "maternity_clinics/index.json.jbuilder"}
      end
    end
  end
  
  def search_by_neighborhood
    if params[:neighborhood].nil?
      redirect_to maternity_clinics_path
    else
      @maternity_clinics = MaternityClinic.where(neighborhood: params[:neighborhood])
      respond_to do |format|
        format.html { render template: "maternity_clinics/index.html.slim" }
        format.json { render template: "maternity_clinics/index.json.jbuilder"}
      end
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
