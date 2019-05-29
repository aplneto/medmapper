class UserProfile < ApplicationRecord
  belongs_to :account
  
  has_many :comments

  has_one :service_provider

  validates :name, presence: true, length: { maximum: 100 }
  validates :sex, length: { maximum: 1 }

end
