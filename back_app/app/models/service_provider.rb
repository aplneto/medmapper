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

  # Google Maps
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode

  # Callbacks
  before_save :set_upcase

  #Queries
  def self.by_neighborhood(neighborhood)
    where('neighborhood = :n', n: neighborhood)
  end

  def self.by_services(*services)
    where('services @> ARRAY[:s]', s: services)
  end

  def self.keyword_search(*keywords)
    where('services @> ARRAY[:k] or neighborhood = ANY(ARRAY[:k]) or
     description LIKE ANY(ARRAY[:k])', k: keywords)
  end

  private
  def set_upcase
    self.name.upcase!

    self.address.upcase!
    self.neighborhood.upcase!

    self.services.each do |service|
      service.upcase!
    end
    
    self.desciption.upcase!
  end

end
