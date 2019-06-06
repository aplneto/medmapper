class FamilyHealthSupportCenter < ApplicationRecord
    has_many :comments, as: :page

    validates :team, presence: true, length: { maximum: 10 }
    validates :support_point, presence: true, length: { maximum: 50 }
    validates :name, presence: true, length: { maximum: 80 }
    validates :area, presence: true, length: { maximum: 50 }
    validates :phone, length: { maximum: 25 }
    validates :latitude, :longitude, numericality: true
    validates :district, numericality: { only_integer: true }

end
