class Service < ApplicationRecord
  self.primary_key = :provider_id, :provider_type, :tag
  belongs_to :provider, polymorphic: true
end
