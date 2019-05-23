module GeneralModelHelper
    def multi_tag_search (hospital, model)
        statements = []
        hospital.attributes.to_a.each do |k, v|
            unless v.nil?
                statements << "#{k} = #{v}"
            end
        if statements.any?
            model.where(statements.join(' and '))
        end
        end
    end
end