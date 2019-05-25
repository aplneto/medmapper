class Place < ApplicationRecord
  self.primary_key = :professional_id, :place

  belongs_to :professional
end
