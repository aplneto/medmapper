class Specialty < ApplicationRecord
  self.primary_key = :health_unit_id, :specialty
  belongs_to :health_unit
end
