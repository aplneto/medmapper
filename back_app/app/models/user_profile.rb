class UserProfile < ApplicationRecord
  belongs_to :account
  
  has_many :comments

  has_one :service_provider
end
