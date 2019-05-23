class FamilyHealthUnitsController < ApplicationController
  before_action :set_family_health_unit, only: [:show, :edit, :update, :destroy]

  # GET /family_health_units
  # GET /family_health_units.json
  def index
    @family_health_units = FamilyHealthUnit.all
  end

  # GET /family_health_units/1
  # GET /family_health_units/1.json
  def show
  end

  # GET /family_health_units/new
  def new
    @family_health_unit = FamilyHealthUnit.new
  end

  # GET /family_health_units/1/edit
  def edit
  end

  # POST /family_health_units
  # POST /family_health_units.json
  def create
    @family_health_unit = FamilyHealthUnit.new(family_health_unit_params)

    respond_to do |format|
      if @family_health_unit.save
        format.html { redirect_to @family_health_unit, notice: 'Family health unit was successfully created.' }
        format.json { render :show, status: :created, location: @family_health_unit }
      else
        format.html { render :new }
        format.json { render json: @family_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_health_units/1
  # PATCH/PUT /family_health_units/1.json
  def update
    respond_to do |format|
      if @family_health_unit.update(family_health_unit_params)
        format.html { redirect_to @family_health_unit, notice: 'Family health unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @family_health_unit }
      else
        format.html { render :edit }
        format.json { render json: @family_health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_health_units/1
  # DELETE /family_health_units/1.json
  def destroy
    @family_health_unit.destroy
    respond_to do |format|
      format.html { redirect_to family_health_units_url, notice: 'Family health unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_health_unit
      @family_health_unit = FamilyHealthUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_health_unit_params
      params.fetch(:family_health_unit, {})
    end
end
