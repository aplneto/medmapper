class MentalHealthUnitsController < ApplicationController
  before_action :set_mental_health_unit, only: [:show, :edit, :update, :destroy]

  # GET /mental_health_units
  # GET /mental_health_units.json
  def index
    @mental_health_units = MentalHealthUnit.all
  end

  # GET /mental_health_units/1
  # GET /mental_health_units/1.json
  def show
  end

  # GET /mental_health_units/new
  def new
    @mental_health_unit = MentalHealthUnit.new
  end

  # GET /mental_health_units/1/edit
  def edit
  end

  # POST /mental_health_units
  # POST /mental_health_units.json
  def create
    @mental_health_unit = MentalHealthUnit.new(mental_health_unit_params)

    respond_to do |format|
      if @mental_health_unit.save
        format.html { redirect_to @mental_health_unit, notice: 'Mental health unit was successfully created.' }
        format.json { render :show, status: :created, location: @mental_health_unit }
      else
        format.html { render :new }
        format.json { render json: @mental_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mental_health_units/1
  # PATCH/PUT /mental_health_units/1.json
  def update
    respond_to do |format|
      if @mental_health_unit.update(mental_health_unit_params)
        format.html { redirect_to @mental_health_unit, notice: 'Mental health unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @mental_health_unit }
      else
        format.html { render :edit }
        format.json { render json: @mental_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mental_health_units/1
  # DELETE /mental_health_units/1.json
  def destroy
    @mental_health_unit.destroy
    respond_to do |format|
      format.html { redirect_to mental_health_units_url, notice: 'Mental health unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mental_health_unit
      @mental_health_unit = MentalHealthUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mental_health_unit_params
      params.require(:mental_health_unit).permit(:health_unit_id, :type)
    end
end
