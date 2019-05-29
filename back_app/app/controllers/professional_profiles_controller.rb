class ProfessionalProfilesController < ApplicationController
  before_action :set_professional_profile, only: [:show, :edit, :update, :destroy]

  # GET /professional_profiles
  # GET /professional_profiles.json
  def index
    @professional_profiles = ProfessionalProfile.all
  end

  # GET /professional_profiles/1
  # GET /professional_profiles/1.json
  def show
  end

  # GET /professional_profiles/new
  def new
    @professional_profile = ProfessionalProfile.new
  end

  # GET /professional_profiles/1/edit
  def edit
  end

  # POST /professional_profiles
  # POST /professional_profiles.json
  def create
    @professional_profile = ProfessionalProfile.new(professional_profile_params)

    respond_to do |format|
      if @professional_profile.save
        format.html { redirect_to @professional_profile, notice: 'Professional profile was successfully created.' }
        format.json { render :show, status: :created, location: @professional_profile }
      else
        format.html { render :new }
        format.json { render json: @professional_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /professional_profiles/1
  # PATCH/PUT /professional_profiles/1.json
  def update
    respond_to do |format|
      if @professional_profile.update(professional_profile_params)
        format.html { redirect_to @professional_profile, notice: 'Professional profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @professional_profile }
      else
        format.html { render :edit }
        format.json { render json: @professional_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_profiles/1
  # DELETE /professional_profiles/1.json
  def destroy
    @professional_profile.destroy
    respond_to do |format|
      format.html { redirect_to professional_profiles_url, notice: 'Professional profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_profile
      @professional_profile = ProfessionalProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def professional_profile_params
      params.require(:professional_profile).permit(:registry, :ocupation, :validation, :contacts, :places, :services, :cpf, :user_profile_id)
    end
end
