class Hospital < ActiveRecord::Base

    validates :cnes, presence: true, numericality: true
    validates :name, presence: true, length: { maximum: 80 }
    validates :address, presence: true, length: { maximum: 50 }
    validates :neighborhood, presence: true, length: { maximum: 30 }
    validates :phone, presence: true, length: { in: 10..25 }
    validates :latitude, :longitude, presence: true, length: { maximum: 20 }
    validates :type, presence: true
    validate :phone_format

    # Uncomment statement below to set polymorphic association to comments table
    #has_many :comments, as: :specific_unit
    def phone_format
        unless /0?\d{2}\s?-?\s?\d{4,5}\s?-?\s?\d{4}/.match? phone
            errors.add(:phone, 'has to match a valid format')
        end
    end

end
