class AbstractUnit < ApplicationRecord
    self.abstract_class = true
    
    belongs_to :health_unit

    validates_associated :health_unit
    validates :health_unit, presence: true, uniqueness: true

end