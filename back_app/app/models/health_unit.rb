class HealthUnit < ApplicationRecord
    validates :cnes, presence: true, numericality: true
    validates :name, presence: true, length: { maximum: 100 }
    validates :address, presence: true, length: { maximum: 100 }
    validates :neighborhood, presence: true, length: { maximum: 30 }
    validates :phone, presence: true, length: { maximum: 25 }
    validates :latitude, :longitude, presence: true, length: { maximum: 20 }

    has_one :hospital
    has_one :pharmacy
    has_one :specialized_unit
    has_one :basic_health_unit

    #polymorphic association to comments
    has_many :comments, as: :page

end
