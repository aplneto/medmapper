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

  # Callbacks
  before_save :set_upcase

  private
  def set_upcase
    self.name.upcase!

    self.address.upcase!
    self.neighborhood.upcase!

    self.services.each do |service|
      service.upcase!
    end
  end

end
