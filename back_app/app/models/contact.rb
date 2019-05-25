class Contact < ApplicationRecord
  self.primary_key = :professional_id, :category, :info

  belongs_to :professional
end
