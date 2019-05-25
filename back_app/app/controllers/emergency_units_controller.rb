class EmergencyUnitsController < ApplicationController
  before_action :set_emergency_unit, only: [:show, :edit, :update, :destroy]

  # GET /emergency_units
  # GET /emergency_units.json
  def index
    @emergency_units = EmergencyUnit.all
  end

  # GET /emergency_units/1
  # GET /emergency_units/1.json
  def show
  end

  # GET /emergency_units/new
  def new
    @emergency_unit = EmergencyUnit.new
  end

  # GET /emergency_units/1/edit
  def edit
  end

  # POST /emergency_units
  # POST /emergency_units.json
  def create
    @emergency_unit = EmergencyUnit.new(emergency_unit_params)

    respond_to do |format|
      if @emergency_unit.save
        format.html { redirect_to @emergency_unit, notice: 'Emergency unit was successfully created.' }
        format.json { render :show, status: :created, location: @emergency_unit }
      else
        format.html { render :new }
        format.json { render json: @emergency_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emergency_units/1
  # PATCH/PUT /emergency_units/1.json
  def update
    respond_to do |format|
      if @emergency_unit.update(emergency_unit_params)
        format.html { redirect_to @emergency_unit, notice: 'Emergency unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @emergency_unit }
      else
        format.html { render :edit }
        format.json { render json: @emergency_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emergency_units/1
  # DELETE /emergency_units/1.json
  def destroy
    @emergency_unit.destroy
    respond_to do |format|
      format.html { redirect_to emergency_units_url, notice: 'Emergency unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emergency_unit
      @emergency_unit = EmergencyUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emergency_unit_params
      params.require(:emergency_unit).permit(:health_unit_id, :type)
    end
end
