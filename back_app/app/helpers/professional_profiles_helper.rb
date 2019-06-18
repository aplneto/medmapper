module ProfessionalProfilesHelper

    def user_has_professional_profile?(user_profile)
        ProfessionalProfile.exists?(user_profile_id: user_profile.id)
    end
    
    def edit_own_professional_profile
        user_profile = UserProfile.find_by account_id: current_account.id
        unless !account_signed_in? || user_profile.nil?
            if user_has_professional_profile? user_profile
                professional_profile = ProfessionalProfile.find_by user_profile_id: user_profile.id
                return link_to user_profile.name,
                edit_professional_profile_path(professional_profile)
            else
                return link_to user_profile.name, new_professional_profile
            end
        end
        unless account_signed_in?
            return link_to "Login", new_session_path
        else
            return link_to "Crie seu perfil", new_user_profile_path
        end
    end

    def help_contacts_field
        "Separe suas informações de contato por espaço."
    end

    def help_places_field
        "Separe seus locais de trabalho por espaço."
    end

    def help_services_field
        "Separe os serviços que você presta por espaço."
    end
end
