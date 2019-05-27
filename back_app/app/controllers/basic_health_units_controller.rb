class BasicHealthUnitsController < ApplicationController
  before_action :set_basic_health_unit, only: [:show, :edit, :update, :destroy]

  # GET /basic_health_units
  # GET /basic_health_units.json
  def index
    @basic_health_units = BasicHealthUnit.all
  end

  # GET /basic_health_units/1
  # GET /basic_health_units/1.json
  def show
  end

  # GET /basic_health_units/new
  def new
    @basic_health_unit = BasicHealthUnit.new
  end

  # GET /basic_health_units/1/edit
  def edit
  end

  # POST /basic_health_units
  # POST /basic_health_units.json
  def create
    @basic_health_unit = BasicHealthUnit.new(basic_health_unit_params)

    respond_to do |format|
      if @basic_health_unit.save
        format.html { redirect_to @basic_health_unit, notice: 'Basic health unit was successfully created.' }
        format.json { render :show, status: :created, location: @basic_health_unit }
      else
        format.html { render :new }
        format.json { render json: @basic_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /basic_health_units/1
  # PATCH/PUT /basic_health_units/1.json
  def update
    respond_to do |format|
      if @basic_health_unit.update(basic_health_unit_params)
        format.html { redirect_to @basic_health_unit, notice: 'Basic health unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @basic_health_unit }
      else
        format.html { render :edit }
        format.json { render json: @basic_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /basic_health_units/1
  # DELETE /basic_health_units/1.json
  def destroy
    @basic_health_unit.destroy
    respond_to do |format|
      format.html { redirect_to basic_health_units_url, notice: 'Basic health unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_health_unit
      @basic_health_unit = BasicHealthUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def basic_health_unit_params
      params.require(:basic_health_unit).permit(:health_unit_id, :type)
    end
end