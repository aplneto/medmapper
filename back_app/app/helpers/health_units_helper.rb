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
end
