class BasicHealthUnitsController < ApplicationController
  before_action :set_basic_health_unit, only: [:show, :update, :destroy]

  # GET /basic_health_units
  def index
    @basic_health_units = BasicHealthUnit.all

    render json: @basic_health_units
  end

  # GET /basic_health_units/1
  def show
    render json: @basic_health_unit
  end

  # POST /basic_health_units
  def create
    @basic_health_unit = BasicHealthUnit.new(basic_health_unit_params)

    if @basic_health_unit.save
      render json: @basic_health_unit, status: :created, location: @basic_health_unit
    else
      render json: @basic_health_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /basic_health_units/1
  def update
    if @basic_health_unit.update(basic_health_unit_params)
      render json: @basic_health_unit
    else
      render json: @basic_health_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /basic_health_units/1
  def destroy
    @basic_health_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_basic_health_unit
      @basic_health_unit = BasicHealthUnit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def basic_health_unit_params
      params.fetch(:basic_health_unit, {})
    end
end
