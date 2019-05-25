class ServiceProvider < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :page
  has_many :services, as: :provider
end
