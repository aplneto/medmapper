class HealthUnitsController < ApplicationController

  before_action :set_unit_type
  before_action :set_health_unit, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_account!, only: [:create, :update, :destroy]

  # GET /health_units
  # GET /health_units.json
  def index
    @health_units = unit_class.all
  end

  # GET /health_units/1
  # GET /health_units/1.json
  def show
  end

  # GET /health_units/new
  def new
    @health_unit = HealthUnit.new
    @health_unit.specialties = []
    @health_unit.treatments = []
  end

  # GET /health_units/1/edit
  def edit
  end

  # POST /health_units
  # POST /health_units.json
  def create
    @health_unit = unit_class.new(refine_params)

    respond_to do |format|
      if @health_unit.save!
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
      if @health_unit.update!(refine_params)
        format.html { 
          redirect_to @health_unit,
          notice: 'Unidade de Saúde atualizada' }
        format.json { render :show, status: :ok, location: @health_unit }
      else
        format.html { render template: 'health_units/edit.html.slim' }
        format.json { render json: @health_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /health_units/1
  # DELETE /health_units/1.json
  def destroy
    @health_unit.destroy
    respond_to do |format|
      format.html { redirect_to health_units_url, notice: 'Unidade apagada' }
      format.json { head :no_content }
    end
  end

  def basic_search
    if params[:keywords].empty?
      redirect_to health_units_path
    else
      @health_units = unit_class.basic_search(*params[:keywords].upcase
        .split(' '))
      respond_to do |format|
        format.html { 
          flash[:notice] = "#{@health_units.count}
          #{unit_class.model_name.human(count: @health_units.count)}"
          render template: "health_units/index.html.slim" 
        }
        format.json { render template: "health_units/index.json.jbuilder"}
      end
    end
  end

  def list_by_specialties
    @specialty = params[:specialty]
    @health_units = unit_class.by_specialties(*@specialty.upcase.split(' '))
      respond_to do |format|
        format.html {
          flash[:notice] = "#{@health_units.count}
          #{unit_class.model_name.human(count: @health_units.count)}"
          render template: "health_units/specialty.html.slim" 
        }
        format.json { render template: "health_units/index.json.jbuilder"}
      end
  end

  def list_by_treatments
    if params[:treatments].empty?
      redirect_to health_units_path
    else
      @health_units = unit_class.by_treatments(*params[:treatments].upcase
        .split(' '))
      respond_to do |format|
        format.html { 
          flash[:notice] = "#{@health_units.count}
          #{unit_class.model_name.human(count: @health_units.count)}"
          render template: "health_units/index.html.slim"
        }
        format.json { render template: "health_units/index.json.jbuilder"}
      end
    end
  end

  def search_by_neighborhood
    if params[:neighborhood].empty?
      redirect_to health_units_path
    else
      @health_units = unit_class.by_neighborhood(params[:neighborhood].upcase)
      respond_to do |format|
        format.html { 
          flash[:notice] = "#{@health_units.count}
          #{unit_class.model_name.human(count: @health_units.count)}"
          render template: "health_units/index.html.slim" 
        }
        format.json { render template: "health_units/index.json.jbuilder"}
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_health_unit
      @health_unit = unit_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def health_unit_params
      params.require(unit_symbol).permit(:cnes, :name, :address,
        :neighborhood, :phone, :latitude, :longitude, :description,
        :specialties, :treatments, :state, :city, :type, :governance)
    end

    def refine_params
      usable = health_unit_params
      usable[:treatments] = health_unit_params[:treatments].split(' ')
      usable[:specialties] = health_unit_params[:specialties].split(' ')
      if health_unit_params[:type].nil?
        usable[:type] = params['type']
      end
      return usable
    end

    def set_unit_type
      @unit_type = unit_type
    end

    def unit_type
      HealthUnit::TYPES.include?(params[:type]) ? params[:type] : "HealthUnit"
    end

    def unit_class
      unit_type.constantize
    end

    def unit_symbol
      unit_type.underscore.to_sym
    end
end
