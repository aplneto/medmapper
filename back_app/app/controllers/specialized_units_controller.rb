class SpecializedUnitsController < ApplicationController
  before_action :set_specialized_unit, only: [:show, :edit, :update, :destroy]

  # GET /specialized_units
  # GET /specialized_units.json
  def index
    @specialized_units = SpecializedUnit.all
  end

  # GET /specialized_units/1
  # GET /specialized_units/1.json
  def show
    redirect_to controller: 'health_units', action: 'show',
    id: @specialized_unit.id
  end

  # GET /specialized_units/new
  def new
    @specialized_unit = SpecializedUnit.new
  end

  # GET /specialized_units/1/edit
  def edit
  end

  # POST /specialized_units
  # POST /specialized_units.json
  def create
    @specialized_unit = SpecializedUnit.new(specialized_unit_params)

    respond_to do |format|
      if @specialized_unit.save
        format.html { redirect_to @specialized_unit, notice: 'Specialized unit was successfully created.' }
        format.json { render :show, status: :created, location: @specialized_unit }
      else
        format.html { render :new }
        format.json { render json: @specialized_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /specialized_units/1
  # PATCH/PUT /specialized_units/1.json
  def update
    respond_to do |format|
      if @specialized_unit.update(specialized_unit_params)
        format.html { redirect_to @specialized_unit, notice: 'Specialized unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @specialized_unit }
      else
        format.html { render :edit }
        format.json { render json: @specialized_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /specialized_units/1
  # DELETE /specialized_units/1.json
  def destroy
    @specialized_unit.destroy
    respond_to do |format|
      format.html { redirect_to specialized_units_url, notice: 'Specialized unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def basic_search
    if params[:keywords].empty?
      redirect_to specialized_units_path
    else
      @specialized_units = SpecializedUnit.where("specialties && :kw or 
        treatments && :kw", kw: params[:keywords].split(' '))
      respond_to do |format|
        format.html { render template: "specialized_units/index.html.slim" }
        format.json { render template: "specialized_units/index.json.jbuilder"}
      end
    end
  end
  
  def list_by_specialties
    if params[:specialty].nil?
      redirect_to specialized_units_path
    else
      @specialty = params[:specialty]
      @specialized_units = SpecializedUnit.where("specialties && ARRAY[?]",
        @specialty)
      respond_to do |format|
        format.html { render template: "specialized_units/specialty.html.slim" }
        format.json { render template: "specialized_units/index.json.jbuilder"}
      end
    end
  end
  
  def list_by_treatments
    if params[:treatments].empty?
      redirect_to specialized_units_path
    else
      @specialized_unit = SpecializedUnit.where("treatments && ?",
        params[:treatments].split(' '))
      respond_to do |format|
        format.html { render template: "specialized_units/index.html.slim" }
        format.json { render template: "specialized_units/index.json.jbuilder"}
      end
    end
  end
  
  def search_by_neighborhood
    if params[:neighborhood].nil?
      redirect_to specialized_units_path
    else
      @specialized_units = SpecializedUnit.where(neighborhood: params[:neighborhood])
      respond_to do |format|
        format.html { render template: "specialized_units/index.html.slim" }
        format.json { render template: "specialized_units/index.json.jbuilder"}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialized_unit
      @specialized_unit = SpecializedUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def specialized_unit_params
      params.require(:specialized_unit).permit(:health_unit_id, :type)
    end
end
