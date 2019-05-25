class Service < ApplicationRecord
  belongs_to :provider, polymorphic: true
end
