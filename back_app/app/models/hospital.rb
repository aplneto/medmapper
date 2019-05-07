class Hospital < ApplicationRecord
    self.primary_key = 'registry'
    
    validates :registry, presence: true, length: { is: 7 },
    numericality: { only_integer: true }

    validades :name, presence: true, length: { in: 10..100 }
    validades :telephone, presence: true, length: { is: 10 }
    validades :address, presence: true, length: { maximum: 50 }
    validades :neighborhood, presence: true, length: { maximum: 30}

    validades :latitude, :longitude, presence: true, length: { is: 20}

    validades :region, :micro_region, presence: true, length: { is: 1},
    numericality: { only_integer: true }

    validades :nature, presence: true, length: { maximum: 15 }
    validades :specialties, presence: true, length { maximum: 80 }
end
