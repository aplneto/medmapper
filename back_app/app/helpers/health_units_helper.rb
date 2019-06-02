module HealthUnitsHelper
    def set_health_unit
        if params.has_key? :id
            HealthUnit.find(params[:id])
        end
    end
end
