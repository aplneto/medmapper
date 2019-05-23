class PolyclincsController < ApplicationController
  before_action :set_polyclinc, only: [:show, :edit, :update, :destroy]

  # GET /polyclincs
  # GET /polyclincs.json
  def index
    @polyclincs = Polyclinc.all
  end

  # GET /polyclincs/1
  # GET /polyclincs/1.json
  def show
  end

  # GET /polyclincs/new
  def new
    @polyclinc = Polyclinc.new
  end

  # GET /polyclincs/1/edit
  def edit
  end

  # POST /polyclincs
  # POST /polyclincs.json
  def create
    @polyclinc = Polyclinc.new(polyclinc_params)

    respond_to do |format|
      if @polyclinc.save
        format.html { redirect_to @polyclinc, notice: 'Polyclinc was successfully created.' }
        format.json { render :show, status: :created, location: @polyclinc }
      else
        format.html { render :new }
        format.json { render json: @polyclinc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /polyclincs/1
  # PATCH/PUT /polyclincs/1.json
  def update
    respond_to do |format|
      if @polyclinc.update(polyclinc_params)
        format.html { redirect_to @polyclinc, notice: 'Polyclinc was successfully updated.' }
        format.json { render :show, status: :ok, location: @polyclinc }
      else
        format.html { render :edit }
        format.json { render json: @polyclinc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /polyclincs/1
  # DELETE /polyclincs/1.json
  def destroy
    @polyclinc.destroy
    respond_to do |format|
      format.html { redirect_to polyclincs_url, notice: 'Polyclinc was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_polyclinc
      @polyclinc = Polyclinc.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def polyclinc_params
      params.fetch(:polyclinc, {})
    end
end
