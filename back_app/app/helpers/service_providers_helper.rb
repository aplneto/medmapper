module ServiceProvidersHelper
    
    def help_find_coordinates
        link_to 'Ajuda','https://support.google.com/maps/answer/185
39?co=GENIE.Platform%3DDesktop&hl=pt-BR', target: :_blank,
title: "Quer ajuda para encontrar suas coordenadas?"
    end

    def tags_with_links(*services)
        services.map { |s| link_to s,
            services_service_providers_path(services: s) }
    end

    def neighborhood_tag(neighborhood)
        link_to neighborhood,
        neighborhood_service_providers_path(neighborhood: neighborhood)
    end

end
