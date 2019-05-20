class Specialty < ApplicationRecord
    belongs_to :unit, polymorphic: true
    
    validates :name, :unit_type, presence: true
    validates :unit_id, numericality: { only_integer: true }
end
