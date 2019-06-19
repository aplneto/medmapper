class UserProfilesController < ApplicationController
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_action :profile_owner, only: [:edit, :update, :destroy]
  before_action :authenticate_account!, only: [:new, :edit, :update, :destroy]
  before_action :account_has_profile, only: [:new]

  # GET /user_profiles
  # GET /user_profiles.json
  def index
    @user_profiles = UserProfile.all
  end

  # GET /user_profiles/1
  # GET /user_profiles/1.json
  def show
  end

  # GET /user_profiles/new
  def new
    @user_profile = UserProfile.new
  end

  # GET /user_profiles/1/edit
  def edit
  end

  # POST /user_profiles
  # POST /user_profiles.json
  # Define automáticamente o account_id para o id do usuário logado
  def create
    @user_profile = UserProfile.new(user_profile_params)
    @user_profile.account_id = current_account.id

    respond_to do |format|
      if @user_profile.save
        format.html { redirect_to @user_profile, notice: "Perfil criado com 
          sucesso. Seja bem-vindo #{@user_profile.name}!" }
        format.json { render :show, status: :created, location: @user_profile }
      else
        format.html { render :new }
        format.json { render json: @user_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_profiles/1
  # PATCH/PUT /user_profiles/1.json
  def update
    respond_to do |format|

      new_information = user_profile_params
      new_information[:account_id] = current_account.id
      if @user_profile.update(new_information)
        format.html { redirect_to @user_profile, notice: 'Seu perfil foi
          atualizado' }
        format.json { render :show, status: :ok, location: @user_profile }
      else
        format.html { render :edit }
        format.json { render json: @user_profile.errors,
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_profiles/1
  # DELETE /user_profiles/1.json
  def destroy
    @user_profile.destroy
    respond_to do |format|
      format.html { redirect_to user_profiles_url,
        notice: 'User profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_profile
      @user_profile = UserProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_profile_params
      params.require(:user_profile).permit(:name, :sex, :birthday, :phone,
        :description, :picture)
    end

    # Método de verificação do proprietário do perfil, garante que a edição de
    # um perfil pode ser feita apenas por seu proprietário.
    def profile_owner
      unless account_signed_in?
        redirect_to new_account_session_path
      else
        unless @user_profile.account_id == current_account.id
          respond_to do |format|
            format.html {
              redirect_to user_profile_path(UserProfile.find_by(
                account_id: current_account.id)),
              notice: "Você não pode editar perfis de outros usuários"
            }
            format.json { head :forbidden }
          end
        end
      end
    end

    # Método verifica se o usuário já possui um perfil, impedindo que usuários
    # criem mais de um perfil na plataforma
    def account_has_profile
      unless account_signed_in?
        redirect_to new_account_session_path
      else
        if UserProfile.exists?(account_id: current_account.id)
          respond_to do |format|
            format.html {
              render file: "errors/forbidden", layout: true, notice: "Você já tem 
              um perfil de usuário"
            }
          format.json { head :forbidden }
          end
        end
      end
    end

end
