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
                return link_to user_profile.name, new_professional_profile_path
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

    def services_tags(*services)
        services.map { |m| link_to m,
            services_professional_profiles_path(services: m)}.join(', ')
    end

    def place_tags(*places)
        places.map { |p| link_to p,
            places_professional_profiles_path(places: p)}.join(', ')
    end

    def ocupation_tag(ocupation)
        link_to ocupation,
                ocupation_professional_profiles_path(ocupation: ocupation)
    end

    def social_media_icon(link, iconsize=40, media = :facebook)
        icons = {
            facebook: "https://img.icons8.com/ultraviolet\
/#{iconsize}/000000/facebook-new.png",
            instagram: "https://img.icons8.com/cotton\
/#{iconsize}/000000/instagram-new.png",
            linkedin: "https://img.icons8.com/office\
/#{iconsize}/000000/linkedin.png"
        }
        link_to image_tag(icons[media]), link, title: media.to_s,
            target: '_blank'
    end

    def whatsapp_icon(number, iconsize = 40)
        link_to image_tag("https://img.icons8.com/color\
/#{iconsize}/000000/whatsapp.png"),
        "http://api.whatsapp.com/send?1=pt_BR&phone=55#{number}",
        target: '_blank'
    end

    def social_media(professional, iconsize = 24)
        media = %w'facebook instagram linkedin whatsapp'
        links = {}
        media.each do |word|
            unless professional[word].empty?
                links[word] = professional[word]
            end
        end
        icons = []
        links.each do |service, address|
            if service == 'whatsapp'
                icons << whatsapp_icon(address, iconsize)
            else
                icons << social_media_icon(address, iconsize, media = service.to_sym)
            end
        end
        return icons
    end
end