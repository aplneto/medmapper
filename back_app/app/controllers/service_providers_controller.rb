class ServiceProvidersController < ApplicationController
  before_action :set_service_provider, only: [:show, :edit, :update, :destroy]
  before_action :assert_account_has_profile, only: [:edit, :new, :create, :destroy]

  # GET /service_providers
  # GET /service_providers.json
  def index
    @service_providers = ServiceProvider.all
  end

  # GET /service_providers/1
  # GET /service_providers/1.json
  def show
  end

  # GET /service_providers/new
  def new
    @service_provider = ServiceProvider.new
    @service_provider.services = []
  end

  # GET /service_providers/1/edit
  def edit
  end

  # GET /service_provider/resultados
  def keyword_search
    if params[:keys].empty?
      redirect_to service_providers_path
    else
      @service_providers = ServiceProvider
      .keyword_search(*params[:keys].upcase.split(' '))
      respond_to do |format|
        format.html {
          flash[:notice] = "#{@service_providers.count}
           #{ServiceProvider.model_name.human(count: @service_providers.count)}"
          render :index
          }
      end
    end
  end

  # GET /service_provider/servicos
  def by_services
    if params[:services].empty?
      redirect_to service_providers_path
    else
      @service_providers = ServiceProvider
      .by_services(*params[:services].upcase.split(' '))
      respond_to do |format|
        format.html {
          flash[:notice] = "#{@service_providers.count}
           #{ServiceProvider.model_name.human(count: @service_providers.count)}"
          render :index
          }
      end
    end
  end

  # GET /service_provicer/bairro
  def by_neighborhood
    if params[:neighborhood].empty?
      redirect_to service_providers_path
    else
      @service_providers = ServiceProvider
      .by_neighborhood(params[:neighborhood].upcase)
      respond_to do |format|
        format.html {
          flash[:notice] = "#{@service_providers.count}
           #{ServiceProvider.model_name.human(count: @service_providers.count)}"
          render :index
          }
      end
    end
  end

  # POST /service_providers
  # POST /service_providers.json
  def create
    @service_provider = ServiceProvider.new(service_provider_params)

    respond_to do |format|
      if @service_provider.save
        format.html { redirect_to @service_provider, notice: 'Criado.' }
        format.json { render :show, status: :created, location: @service_provider }
      else
        format.html { render :new }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_providers/1
  # PATCH/PUT /service_providers/1.json
  def update
    respond_to do |format|
      if @service_provider.update(service_provider_params)
        format.html { redirect_to @service_provider, notice: 'Modificado.' }
        format.json { render :show, status: :ok, location: @service_provider }
      else
        format.html { render :edit }
        format.json { render json: @service_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_providers/1
  # DELETE /service_providers/1.json
  def destroy
    @service_provider.destroy
    respond_to do |format|
      format.html { redirect_to service_providers_url, notice: 'Apagado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_provider
      @service_provider = ServiceProvider.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_provider_params
      usable = params.require(:service_provider).permit(:name, :address,
        :neighborhood, :phone, :latitude, :longitude,
        :description, :services, :image, :webpage)
      usable[:services] = usable[:services].split(' ')
      usable[:user_profile_id] = current_logged_user_id
      return usable
    end

end
