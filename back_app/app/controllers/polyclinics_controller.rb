# frozen_string_literal: true

class PolyclinicsController < ApplicationController
  before_action :set_polyclinic, only: %i[show edit update destroy]

  # GET /polyclinics
  # GET /polyclinics.json
  def index
    @polyclinics = Polyclinic.all
  end

  # GET /polyclinics/1
  # GET /polyclinics/1.json
  def show
    redirect_to controller: 'health_units', action: 'show',
                id: @polyclinic.id
  end

  # GET /polyclinics/new
  def new
    redirect_to controller: 'health_units', action: 'new',
                health_unit: Polyclinic.new
  end

  # GET /polyclinics/1/edit
  def edit; end

  # POST /polyclinics
  # POST /polyclinics.json
  def create
    @polyclinic = Polyclinic.new(polyclinic_params)

    respond_to do |format|
      if @polyclinic.save
        format.html { redirect_to @polyclinic, notice: 'Polyclinic was successfully created.' }
        format.json { render :show, status: :created, location: @polyclinic }
      else
        format.html { render :new }
        format.json { render json: @polyclinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polyclinics/1
  # PATCH/PUT /polyclinics/1.json
  def update
    respond_to do |format|
      if @polyclinic.update(polyclinic_params)
        format.html { redirect_to @polyclinic, notice: 'Polyclinic was successfully updated.' }
        format.json { render :show, status: :ok, location: @polyclinic }
      else
        format.html { render :edit }
        format.json { render json: @polyclinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polyclinics/1
  # DELETE /polyclinics/1.json
  def destroy
    @polyclinic.destroy
    respond_to do |format|
      format.html { redirect_to polyclinics_url, notice: 'Polyclinic was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_polyclinic
    @polyclinic = Polyclinic.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def polyclinic_params
    params.require(:polyclinic).permit(:health_unit_id, :type)
  end
end
