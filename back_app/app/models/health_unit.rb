class HealthUnit < ApplicationRecord

    validates :cnes, presence: true, numericality: true
    validates :name, presence: true, length: { maximum: 100 }
    validates :address, presence: true, length: { maximum: 100 }
    validates :neighborhood, presence: true, length: { maximum: 30 }
    validates :phone, length: { maximum: 25 }
    validates :latitude, :longitude, presence: true, length: { maximum: 20 }
    
    types = %w'Hospital Pharmacy SpecializedUnit BasicHealthUnit DiagnosisUnit
    EmergencyUnit MaternityClinic Polyclinic MentalHealthUnit FamilyHealthUnit
    OdontologyUnit'

    categories = %w'Public Private Filantropic'

    validates :type, inclusion: { in: types }
    validates :category, inclusion: { in: categories }

    # polymorphic association to comments
    has_many :comments, as: :page

    # subclasses's dinamyc scoping
    types.each do |type|
        scope type.underscore.to_sym, -> { where(type: type)}
    end

    # categories dinamyc scoping
    categories.each do |category|
        scope "#{category}Only".underscore.to_sym, -> { where(category: category) }
    end

    # Record Helper Methods
    def is_filantropic?
        category == 'Private'
    end

    def is_private?
        category == 'Private'
    end

    def is_public?
        category == 'Public'
    end

    # Queries

    # Faz uma busca a partir de uma array de palavras, procurando qualquer
    # unidade que possua pelo menos um elemento em comum com o array de busca
    def self.basic_search(*keywords)
        unless keywords.any?
            all
        else
            where("specialties && ARRAY[:k] or treatments && ARRAY[:k] or
                neighborhood = ANY(ARRAY[:k]) or name ~ ANY(ARRAY[:k])",
                k: keywords)
        end
    end

    # Faz uma busca nas especialidades da unidade partir de um array de palavras
    def self.by_specialties(*specialties)
        if specialties.empty?
            all
        else
            where("specialties @> ARRAY[:s]", s: specialties)
        end
    end

    # Faz uma busca nos tratamentos da unidade a partir de um array de palavras
    def self.by_treatments(*treatments)
        if treatments.empty?
            all
        else
            where("treatments @> ARRAY[:t]", t: treatments)
        end
    end

    # busca por bairro
    def self.by_neighborhood(neighborhood)
        where("neighborhood = :n", n: neighborhood)
    end

    # filtragem
    def advanced_search(params_hash)
    end

end
