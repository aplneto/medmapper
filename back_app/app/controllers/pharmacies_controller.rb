# frozen_string_literal: true

class PharmaciesController < ApplicationController
  before_action :set_pharmacy, only: %i[show edit update destroy]

  # GET /pharmacies
  # GET /pharmacies.json
  def index
    @pharmacies = Pharmacy.all
  end

  # GET /pharmacies/1
  # GET /pharmacies/1.json
  def show
    redirect_to controller: 'health_units', action: 'show',
                id: @pharmacy.health_unit_id
  end

  # GET /pharmacies/new
  def new
    @pharmacy = Pharmacy.new
    health_unit_options_for_select
  end

  # GET /pharmacies/1/edit
  def edit
    @pharmacy = Pharmacy.find(params[:id])
    health_unit_options_for_select
  end

  # POST /pharmacies
  # POST /pharmacies.json
  def create
    @pharmacy = Pharmacy.new(pharmacy_params)

    respond_to do |format|
      if @pharmacy.save
        format.html { redirect_to @pharmacy, notice: 'Pharmacy was successfully created.' }
        format.json { render :show, status: :created, location: @pharmacy }
      else
        format.html { render :new }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pharmacies/1
  # PATCH/PUT /pharmacies/1.json
  def update
    respond_to do |format|
      if @pharmacy.update(pharmacy_params)
        format.html { redirect_to @pharmacy, notice: 'Pharmacy was successfully updated.' }
        format.json { render :show, status: :ok, location: @pharmacy }
      else
        format.html { render :edit }
        format.json { render json: @pharmacy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pharmacies/1
  # DELETE /pharmacies/1.json
  def destroy
    @pharmacy.destroy
    respond_to do |format|
      format.html { redirect_to pharmacies_url, notice: 'Pharmacy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def health_unit_options_for_select
    @health_unit_options_for_select = HealthUnit.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_pharmacy
    @pharmacy = Pharmacy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pharmacy_params
    params.require(:pharmacy).permit(:health_unit_id)
  end
end
