module UserProfilesHelper

    # Método que verifica se a conta logada possui um perfil associado
    def account_has_user_profile?
        if account_signed_in?
            UserProfile.exists?(account_id: current_account.id)
        else
            false
        end
    end

    # Método que retorna as informações do usuário como links
    def user_profile_info
        @profile = UserProfile.find_by account_id: current_account.id
        if account_signed_in?
            unless @profile.nil?
                link_to @profile.name, user_profile_path(@profile)
            else
                link_to current_account.email, new_user_profile_path
            end
        else
            'Faça login ou cadastra-se para acessar seu perfil'
        end
    end
end