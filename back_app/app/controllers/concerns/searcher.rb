module Searcher
    def list_by_specialties (model_name, specialty)
        model_name.constantize.where("specialties && ARRAY[?]",
            @specialty)
    end
end