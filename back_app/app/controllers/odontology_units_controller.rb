class OdontologyUnitsController < ApplicationController
  before_action :set_odontology_unit, only: [:show, :edit, :update, :destroy]

  # GET /odontology_units
  # GET /odontology_units.json
  def index
    @odontology_units = OdontologyUnit.all
  end

  # GET /odontology_units/1
  # GET /odontology_units/1.json
  def show
    redirect_to controller: 'health_units', action: 'show',
    id: @odontology_unit.health_unit_id
  end

  # GET /odontology_units/new
  def new
    @odontology_unit = OdontologyUnit.new
  end

  # GET /odontology_units/1/edit
  def edit
  end

  # POST /odontology_units
  # POST /odontology_units.json
  def create
    @odontology_unit = OdontologyUnit.new(odontology_unit_params)

    respond_to do |format|
      if @odontology_unit.save
        format.html { redirect_to @odontology_unit, notice: 'Odontology unit was successfully created.' }
        format.json { render :show, status: :created, location: @odontology_unit }
      else
        format.html { render :new }
        format.json { render json: @odontology_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odontology_units/1
  # PATCH/PUT /odontology_units/1.json
  def update
    respond_to do |format|
      if @odontology_unit.update(odontology_unit_params)
        format.html { redirect_to @odontology_unit, notice: 'Odontology unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @odontology_unit }
      else
        format.html { render :edit }
        format.json { render json: @odontology_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odontology_units/1
  # DELETE /odontology_units/1.json
  def destroy
    @odontology_unit.destroy
    respond_to do |format|
      format.html { redirect_to odontology_units_url, notice: 'Odontology unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def basic_search
    if params[:keywords].empty?
      redirect_to odontology_units_path
    else
      @odontology_units = OdontologyUnit.where("specialties && :kw or 
        treatments && :kw", kw: params[:keywords].split(' '))
      respond_to do |format|
        format.html { render template: "odontology_units/index.html.slim" }
        format.json { render template: "odontology_units/index.json.jbuilder"}
      end
    end
  end
  
  def list_by_specialties
    if params[:specialty].nil?
      redirect_to odontology_units_path
    else
      @specialty = params[:specialty]
      @odontology_units = OdontologyUnit.where("specialties && ARRAY[?]",
        @specialty)
      respond_to do |format|
        format.html { render template: "odontology_units/specialty.html.slim" }
        format.json { render template: "odontology_units/index.json.jbuilder"}
      end
    end
  end
  
  def list_by_treatments
    if params[:treatments].empty?
      redirect_to odontology_units_path
    else
      @odontology_unit = OdontologyUnit.where("treatments && ?",
        params[:treatments].split(' '))
      respond_to do |format|
        format.html { render template: "odontology_units/index.html.slim" }
        format.json { render template: "odontology_units/index.json.jbuilder"}
      end
    end
  end
  
  def search_by_neighborhood
    if params[:neighborhood].nil?
      redirect_to odontology_units_path
    else
      @odontology_units = OdontologyUnit.where(neighborhood: params[:neighborhood])
      respond_to do |format|
        format.html { render template: "odontology_units/index.html.slim" }
        format.json { render template: "odontology_units/index.json.jbuilder"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odontology_unit
      @odontology_unit = OdontologyUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def odontology_unit_params
      params.require(:odontology_unit).permit(:health_unit_id, :type)
    end
end
