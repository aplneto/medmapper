class SpecializedUnitsController < ApplicationController
  before_action :set_specialized_unit, only: [:show, :update, :destroy]

  # GET /specialized_units
  def index
    @specialized_units = SpecializedUnit.all

    render json: @specialized_units
  end

  # GET /specialized_units/1
  def show
    render json: @specialized_unit
  end

  # POST /specialized_units
  def create
    @specialized_unit = SpecializedUnit.new(specialized_unit_params)

    if @specialized_unit.save
      render json: @specialized_unit, status: :created, location: @specialized_unit
    else
      render json: @specialized_unit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /specialized_units/1
  def update
    if @specialized_unit.update(specialized_unit_params)
      render json: @specialized_unit
    else
      render json: @specialized_unit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /specialized_units/1
  def destroy
    @specialized_unit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_specialized_unit
      @specialized_unit = SpecializedUnit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def specialized_unit_params
      params.fetch(:specialized_unit, {})
    end
end
