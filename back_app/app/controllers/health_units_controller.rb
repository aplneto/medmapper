# frozen_string_literal: true

class HealthUnitsController < ApplicationController
  before_action :set_health_unit, only: %i[show edit update destroy]
  before_action :authenticate_account!, only: %i[create update destroy]
  load_and_authorize_resource only: %i[new create edit update destroy]

  # GET /health_units
  # GET /health_units.json
  def index
    @health_units = HealthUnit.all
  end

  # GET /health_units/1
  # GET /health_units/1.json
  def show; end

  # GET /health_units/new
  def new; end

  # GET /health_units/1/edit
  def edit; end

  # POST /health_units
  # POST /health_units.json
  def create
    @health_unit = HealthUnit.new(health_unit_params)

    respond_to do |format|
      if @health_unit.save
        format.html { redirect_to @health_unit, notice: 'Health unit was successfully created.' }
        format.json { render :show, status: :created, location: @health_unit }
      else
        format.html { render :new }
        format.json { render json: @health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /health_units/1
  # PATCH/PUT /health_units/1.json
  def update
    respond_to do |format|
      if @health_unit.update(health_unit_params)
        format.html { redirect_to @health_unit, notice: 'Health unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @health_unit }
      else
        format.html { render :edit }
        format.json { render json: @health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_units/1
  # DELETE /health_units/1.json
  def destroy
    @health_unit.destroy
    respond_to do |format|
      format.html { redirect_to health_units_url, notice: 'Health unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def basic_search
    if params[:keywords].empty?
      redirect_to health_units_path
    else
      @health_units = HealthUnit.basic_search(*params[:keywords].split(' '))
      respond_to do |format|
        format.html { render template: 'health_units/index.html.slim' }
        format.json { render template: 'health_units/index.json.jbuilder' }
      end
    end
  end

  def list_by_specialties
    @specialty = params[:specialty]
    @health_units = HealthUnit.by_specialties(*@specialty.split(' '))
    respond_to do |format|
      format.html { render template: 'health_units/specialty.html.slim' }
      format.json { render template: 'health_units/index.json.jbuilder' }
    end
  end

  def list_by_treatments
    if params[:treatments].empty?
      redirect_to health_units_path
    else
      @health_unit = HealthUnit.by_treatments(params[:treatments])
      respond_to do |format|
        format.html { render template: 'health_units/index.html.slim' }
        format.json { render template: 'health_units/index.json.jbuilder' }
      end
    end
  end

  def search_by_neighborhood
    if params[:neighborhood].empty?
      redirect_to health_units_path
    else
      @health_units = HealthUnit.by_neighborhood(params[:neighborhood])
      respond_to do |format|
        format.html { render template: 'health_units/index.html.slim' }
        format.json { render template: 'health_units/index.json.jbuilder' }
      end
    end
  end

  def advanced_search
    @health_unit = HealthUnit.new
  end

  def advanced_search_results; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_health_unit
    @health_unit = HealthUnit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def health_unit_params
    params.require(:health_unit).permit(:cnes, :name, :address, :neighborhood,
                                        :phone, :latitude, :longitude, :description, :specialties, :treatments,
                                        :state, :city)
  end
end
