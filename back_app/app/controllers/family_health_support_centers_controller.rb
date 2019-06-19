class FamilyHealthSupportCentersController < ApplicationController
  before_action :set_family_health_support_center, only: [:show, :edit, :update, :destroy]
  before_action :assure_admin_privillege!, only: [:create, :update, :destroy]

  # GET /family_health_support_centers
  # GET /family_health_support_centers.json
  def index
    @family_health_support_centers = FamilyHealthSupportCenter.all
  end

  # GET /family_health_support_centers/1
  # GET /family_health_support_centers/1.json
  def show
  end

  # GET /family_health_support_centers/new
  def new
    @family_health_support_center = FamilyHealthSupportCenter.new
  end

  # GET /family_health_support_centers/1/edit
  def edit
  end

  def support_unit
    if params[:support_unit].empty?
      redirect_to family_health_support_centers_path
    else
      @family_health_support_center = BasicHealthUnit.by_unit(params[:support_unit])
      respond_to do |format|
        format.html { render template: 'health_units/index' }
      end
    end
  end

  # POST /family_health_support_centers
  # POST /family_health_support_centers.json
  def create
    @family_health_support_center = FamilyHealthSupportCenter.new(family_health_support_center_params)

    respond_to do |format|
      if @family_health_support_center.save
        format.html { redirect_to @family_health_support_center, notice: 'Family health support center was successfully created.' }
        format.json { render :show, status: :created, location: @family_health_support_center }
      else
        format.html { render :new }
        format.json { render json: @family_health_support_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /family_health_support_centers/1
  # PATCH/PUT /family_health_support_centers/1.json
  def update
    respond_to do |format|
      if @family_health_support_center.update(family_health_support_center_params)
        format.html { redirect_to @family_health_support_center, notice: 'Family health support center was successfully updated.' }
        format.json { render :show, status: :ok, location: @family_health_support_center }
      else
        format.html { render :edit }
        format.json { render json: @family_health_support_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /family_health_support_centers/1
  # DELETE /family_health_support_centers/1.json
  def destroy
    @family_health_support_center.destroy
    respond_to do |format|
      format.html { redirect_to family_health_support_centers_url, notice: 'Family health support center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_family_health_support_center
      @family_health_support_center = FamilyHealthSupportCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def family_health_support_center_params
      params.require(:family_health_support_center).permit(:team,
        :support_point, :name, :area, :phone, :latitude, :longitude, :district,
        :health_unit_id)
    end
end
