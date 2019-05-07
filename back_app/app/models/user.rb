class User < ApplicationRecord

    validates :login, presence: true, uniqueness: true, length: { maximum:15 }
    validates :name, presence: true, length: { maximum: 30 }
    validates :sex, presence: true, inclusion: { in: %w(m f) }
    validates :telephone, length: { maximum: 11 }
    validates :address, length: { maximum: 50 }
    validates :neighborhood, length: { maximum: 30 }

    validates :adult?
    validates :birthday, presence: true

    def adult?
        if (Time.new - Time.new birthday) / (365*24*60*60) < 18
            errors.add(:birthday, 'é necessário ter mais de 18 anos para se
                cadastrar')
        end
end
