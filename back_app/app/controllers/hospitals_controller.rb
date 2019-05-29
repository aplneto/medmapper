class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :edit, :update, :destroy]

  # GET /hospitals
  # GET /hospitals.json
  def index
    @hospitals = Hospital.all
  end

  # GET /hospitals/1
  # GET /hospitals/1.json
  def show
    redirect_to controller: 'health_units', action: 'show',
    id: @hospital.health_unit_id
  end

  # GET /hospitals/new
  def new
    @hospital = Hospital.new
  end

  # GET /hospitals/1/edit
  def edit
  end

  # POST /hospitals
  # POST /hospitals.json
  def create
    @hospital = Hospital.new(hospital_params)

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to @hospital, notice: 'Hospital was successfully created.' }
        format.json { render :show, status: :created, location: @hospital }
      else
        format.html { render :new }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hospitals/1
  # PATCH/PUT /hospitals/1.json
  def update
    respond_to do |format|
      if @hospital.update(hospital_params)
        format.html { redirect_to @hospital, notice: 'Hospital was successfully updated.' }
        format.json { render :show, status: :ok, location: @hospital }
      else
        format.html { render :edit }
        format.json { render json: @hospital.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hospitals/1
  # DELETE /hospitals/1.json
  def destroy
    @hospital.destroy
    respond_to do |format|
      format.html { redirect_to hospitals_url, notice: 'Hospital was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def basic_search
    if params[:keywords].empty?
      redirect_to hospitals_path
    else
      @hospitals = Hospital.where("specialties && :kw or 
        treatments && :kw", kw: params[:keywords].split(' '))
      respond_to do |format|
        format.html { render template: "hospitals/index.html.slim" }
        format.json { render template: "hospitals/index.json.jbuilder"}
      end
    end
  end

  def list_by_specialties
    if params[:specialty].nil?
      redirect_to hospitals_path
    else
      @specialty = params[:specialty]
      @hospitals = Hospital.where("specialties && ARRAY[?]",
        @specialty)
      respond_to do |format|
        format.html { render template: "hospitals/specialty.html.slim" }
        format.json { render template: "hospitals/index.json.jbuilder"}
      end
    end
  end

  def list_by_treatments
    if params[:treatments].empty?
      redirect_to hospitals_path
    else
      @hospital = Hospital.where("treatments && ?",
        params[:treatments].split(' '))
      respond_to do |format|
        format.html { render template: "hospitals/index.html.slim" }
        format.json { render template: "hospitals/index.json.jbuilder"}
      end
    end
  end

  def search_by_neighborhood
    if params[:neighborhood].nil?
      redirect_to Hospital_path
    else
      @hospitals = Hospital.where(neighborhood: params[:neighborhood])
      respond_to do |format|
        format.html { render template: "hospitals/index.html.slim" }
        format.json { render template: "hospitals/index.json.jbuilder"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hospital
      @hospital = Hospital.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hospital_params
      params.require(:hospital).permit(:health_unit_id, :type)
    end
end
