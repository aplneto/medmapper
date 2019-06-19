module FamilyHealthUnitsHelper
    def district_tag(number)
        link_to number, district_family_health_support_centers_path(district: number)
    end
end
