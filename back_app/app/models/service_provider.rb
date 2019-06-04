class ServiceProvider < ApplicationRecord
  belongs_to :user_profile
  
  has_many :comments, as: :page

  validates :name, presence: true, uniqueness: true,
  length: { maximum: 100 }
  validates :address, presence: true, length: { maximum: 100 }
  validates :neighborhood, presence: true, length: { maximum: 30 }
  validates :phone, length: { maximum: 25 }
  validates :latitude, :longitude, numericality: true
  validates :description, length: { maximum: 1000 }

end
