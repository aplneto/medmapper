# frozen_string_literal: true

class DiagnosisUnitsController < ApplicationController
  before_action :set_diagnosis_unit, only: %i[show edit update destroy]

  # GET /diagnosis_units
  # GET /diagnosis_units.json
  def index
    @diagnosis_units = DiagnosisUnit.all
  end

  # GET /diagnosis_units/1
  # GET /diagnosis_units/1.json
  def show
    redirect_to controller: 'health_units', action: 'show',
    id: @diagnosis_unit.id
  end

  # GET /diagnosis_units/new
  def new
    redirect_to controller: 'health_units', action: 'new',
    health_unit: DiagnosisUnit.new
  end

  # GET /diagnosis_units/1/edit
  def edit
    # health_unit_options_for_select
  end

  # POST /diagnosis_units
  # POST /diagnosis_units.json
  def create
    @diagnosis_unit = DiagnosisUnit.new(diagnosis_unit_params)

    respond_to do |format|
      if @diagnosis_unit.save
        format.html { redirect_to @diagnosis_unit, notice: 'Diagnosis unit was successfully created.' }
        format.json { render :show, status: :created, location: @diagnosis_unit }
      else
        format.html { render :new }
        format.json { render json: @diagnosis_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diagnosis_units/1
  # PATCH/PUT /diagnosis_units/1.json
  def update
    respond_to do |format|
      if @diagnosis_unit.update(diagnosis_unit_params)
        format.html { redirect_to @diagnosis_unit, notice: 'Diagnosis unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @diagnosis_unit }
      else
        format.html { render :edit }
        format.json { render json: @diagnosis_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diagnosis_units/1
  # DELETE /diagnosis_units/1.json
  def destroy
    @diagnosis_unit.destroy
    respond_to do |format|
      format.html { redirect_to diagnosis_units_url, notice: 'Diagnosis unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def basic_search
    if params[:keywords].empty?
      redirect_to diagnosis_units_path
    else
      @diagnosis_units = DiagnosisUnit.where("specialties && :kw or
        treatments && :kw", kw: params[:keywords].split(' '))
      respond_to do |format|
        format.html { render template: 'diagnosis_units/index.html.slim' }
        format.json { render template: 'diagnosis_units/index.json.jbuilder' }
      end
    end
  end

  def list_by_specialties
    if params[:specialty].nil?
      redirect_to diagnosis_units_path
    else
      @specialty = params[:specialty]
      @diagnosis_units = DiagnosisUnit.where('specialties && ARRAY[?]', @specialty)
      respond_to do |format|
        format.html { render template: 'diagnosis_units/specialty.html.slim' }
        format.json { render template: 'diagnosis_units/index.json.jbuilder' }
      end
    end
  end

  def list_by_treatments
    if params[:treatments].empty?
      redirect_to diagnosis_units_path
    else
      @diagnosis_unit = DiagnosisUnit.where('treatments && ?',
                                            params[:treatments].split(' '))
      respond_to do |format|
        format.html { render template: 'diagnosis_units/index.html.slim' }
        format.json { render template: 'diagnosis_units/index.json.jbuilder' }
      end
    end
  end

  def search_by_neighborhood
    if params[:neighborhood].nil?
      redirect_to diagnosis_units_path
    else
      @diagnosis_units = DiagnosisUnit.where(neighborhood: params[:neighborhood])
      respond_to do |format|
        format.html { render template: 'diagnosis_units/index.html.slim' }
        format.json { render template: 'diagnosis_units/index.json.jbuilder' }
      end
    end
  end

  private

  def health_unit_options_for_select
    @health_unit_options_for_select = HealthUnit.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_diagnosis_unit
    @diagnosis_unit = DiagnosisUnit.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def diagnosis_unit_params
    params.require(:diagnosis_unit).permit(:health_unit_id, :type)
  end
end
