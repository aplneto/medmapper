class Hospital < ApplicationRecord

    validates :name, presence: true, length: { in: 10..100 }
    validates :telephone, presence: true, length: { is: 10 }
    validates :address, presence: true, length: { maximum: 50 }
    validates :neighborhood, presence: true, length: { maximum: 30 }
    validates :latitude, :longitude, presence: true, length: { maximum: 20 }

    validates :region, :micro_region, presence: true, length: { is: 1 },
    numericality: { only_integer: true }

    validates :nature, presence: true, length: { maximum: 15 }
    validates :specialties, presence: true, length: { maximum: 80 }

    has_many :comentaries

end
