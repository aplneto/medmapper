class ProfessionalProfilesController < ApplicationController
  before_action :set_professional_profile, only: [:show, :edit, :update,
    :destroy]
  before_action :authenticate_account!, only: [:new, :create, :edit, :update,
    :destroy]
  before_action :assert_account_has_profile, only: [:new, :create]
  before_action :assert_that_user_owns_profile, only: [:edit, :update]
  before_action :assert_user_can_see_profile, only: [:show]

  # GET /professional_profiles
  # GET /professional_profiles.json
  def index
    if account_is_administrator?
      @professional_profiles = ProfessionalProfile.all
    else
      @professional_profiles = ProfessionalProfile.valid
    end
  end

  # GET /professional_profiles/1
  # GET /professional_profiles/1.json
  def show
    redirect_to user_profile_path(@professional_profile.user_profile)
  end

  # GET /professional_profiles/new
  def new
    @professional_profile = ProfessionalProfile.new
    @professional_profile.contacts = []
    @professional_profile.places = []
    @professional_profile.services = []
  end

  # GET /professional_profiles/1/edit
  def edit
  end

  # POST /professional_profiles
  # POST /professional_profiles.json
  def create
    @professional_profile = ProfessionalProfile.new(usable_params)
    @professional_profile.user_profile_id = current_logged_user_id
    @professional_profile.validation = false

    respond_to do |format|
      if @professional_profile.save
        format.html { redirect_to @professional_profile,
          notice: 'Criado' }
        format.json { render :show, status: :created,
          location: @professional_profile }
      else
        format.html { render :new }
        format.json { render json: @professional_profile.errors,
          status: :unprocessable_entity }
      end
    end
  end

  def basic_search
    if params[:terms].empty?
      redirect_to professional_profiles_path
    else
      @professional_profiles = ProfessionalProfile
      .basic_search(*params[:terms].upcase.split(' '))
      unless account_is_administrator?
        @professional_profiles = @professional_profiles.valid
      end
      aux_count = @professional_profiles.count
      respond_to do |format|
        format.html { 
          flash[:notice] = "#{ProfessionalProfile.model_name
          .human(count: aux_count)}: #{aux_count}"

          render template: 'professional_profiles/index'
         }
      end
    end
  end

  # GET /profissionais/servicos
  def search_services
    if params[:services].empty?
      redirect_to professional_profiles_path
    else
      @professional_profiles = ProfessionalProfile
        .by_services(*params[:services].upcase.split(' '))
      unless account_is_administrator?
        @professional_profiles = @professional_profiles.valid
      end
      aux_count = @professional_profiles.count
      respond_to do |format|
        format.html {
          flash[:notice] = "#{ProfessionalProfile.model_name
          .human(count: aux_count)}: #{aux_count}"

          render template: 'professional_profiles/index'
        }
      end
    end
  end

  #GET /profissionais/profissao
  def search_by_ocupation
    if params[:ocupation].empty?
      redirect_to professional_profiles_path
    else
      @professional_profiles = ProfessionalProfile
        .by_ocupation(params[:ocupation].upcase)
      unless account_is_administrator?
        @professional_profiles = @professional_profiles.valid
      end
      aux_count = @professional_profiles.count
      respond_to do |format|
        format.html {
          flash[:notice] = "#{ProfessionalProfile.model_name
          .human(count: aux_count)}: #{aux_count}"
          
          render template: 'professional_profiles/index'
        }
      end
    end
  end

  def search_by_places
    if params[:places].empty?
      redirect_to professional_profiles_path
    else
      @professional_profiles = ProfessionalProfile
        .by_places(*params[:places].upcase.split(' '))
      unless account_is_administrator?
        @professional_profiles = @professional_profiles.valid
      end
      aux_count = @professional_profiles.count
      respond_to do |format|
        format.html {
          flash[:notice] = "#{ProfessionalProfile.model_name
          .human(count: aux_count)}: #{aux_count}"
          
          render template: 'professional_profiles/index'
        }
      end
    end
  end

  # PATCH/PUT /professional_profiles/1
  # PATCH/PUT /professional_profiles/1.json
  def update
    respond_to do |format|
      if @professional_profile.update(usable_params)
        format.html { redirect_to @professional_profile,
          notice: 'Atualizado!' }
        format.json { render :show, status: :ok,
          location: @professional_profile }
      else
        format.html { render :edit }
        format.json { render json: @professional_profile.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professional_profiles/1
  # DELETE /professional_profiles/1.json
  def destroy
    @professional_profile.destroy
    respond_to do |format|
      format.html { redirect_to professional_profiles_url,
        notice: 'Professional profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_professional_profile
      @professional_profile = ProfessionalProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list
    # through.
    def professional_profile_params
      allowed = [:registry, :ocupation, :cpf, :contacts, :places, :services,
        :facebook, :lattes, :instagram, :linkedin, :whatsapp]
      if account_is_administrator?
        allowed << :validation
      end
      params.require(:professional_profile).permit(*allowed)
    end

    def assert_that_user_owns_profile
      unless (@professional_profile.user_profile_id == current_logged_user_id or
        account_is_administrator?)
        redirect_to controller: 'pages', action: 'forbidden'
      end
    end

    def assert_user_can_see_profile
      unless (@professional_profile.validation or account_is_administrator? or
        @professional_profile.user_profile_id == current_logged_user_id)
        redirect_to '/403'
      end
    end

    def usable_params
      usable = professional_profile_params
      usable[:contacts] = professional_profile_params[:contacts].split(' ')
      usable[:places] = professional_profile_params[:places].split(' ')
      usable[:services] = professional_profile_params[:services].split(' ')
      return usable
    end
end