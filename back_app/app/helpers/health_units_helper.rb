module HealthUnitsHelper
    def set_health_unit
        if params.has_key? :id
            HealthUnit.find(params[:id])
        end
    end

    def specialties_field_helper
        "Separe as especialidades por espaço"
    end

    def treatments_field_helper
        "Separe os atendimentos por espaço"
    end

    def specialties_tags(*specialties)
        specialties.map { |s| link_to s,
            specialty_health_units_path(specialty: s)}.join(', ')
    end

    def treatments_tags(*treatments)
        treatments.map { |t| link_to t,
            treatments_health_units_path(treatments: t)}.join('. ')
    end

    def health_unit_neighborhood_tag(neighborhood)
        link_to neighborhood,
                neighborhood_health_units_path(neighborhood: neighborhood)
    end
end
