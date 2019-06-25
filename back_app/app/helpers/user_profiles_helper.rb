module UserProfilesHelper

    # Método que verifica se a conta logada possui um perfil associado
    def account_has_user_profile?
        account_signed_in? and UserProfile.exists?(account_id: current_account.id)
    end

    # Método que retorna as informações do usuário como links
    def user_profile_info
        @profile = UserProfile.find_by account_id: current_account.id
        if account_signed_in?
            unless @profile.nil?
                if @profile.picture.attached?
                    link_to (image_tag url_for(@profile.picture), size: "60x60"),
                    user_profile_path(@profile)
                else
                    link_to @profile.name, user_profile_path(@profile)
                end
            else
                link_to current_account.email, new_user_profile_path
            end
        else
            'Faça login ou cadastra-se para acessar seu perfil'
        end
    end

    def user_profile_picture(size)
        if account_has_user_profile?
            profile = UserProfile.find_by account_id: current_account.id
            if profile.picture.attached?
                picture = profile.picture
            else
                picture = 'user.png'
            end
            link_to (image_tag url_for(picture), size: size),
                user_profile_path(profile)
        elsif account_signed_in?
            link_to (image_tag url_for('user.png'), size: size),
                new_user_profile_path
        end
    end
end