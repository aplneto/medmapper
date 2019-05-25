class Treatment < ApplicationRecord
  self.primary_key = :health_unit_id, :treatment
  belongs_to :health_unit
end
