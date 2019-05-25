class Professional < ApplicationRecord
  belongs_to :user

  has_many :places
  has_many :contacts

  has_many :services, as: :provider
end
