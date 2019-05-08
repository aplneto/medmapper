class User < ApplicationRecord

    validates :login, presence: true, uniqueness: true, length: { maximum: 15 }
    validates :name, presence: true, length: { maximum: 30 }
    validates :sex, presence: true, inclusion: { in: %w(m f) }
    validates :telephone, length: { maximum: 11 }
    validates :email, presence: true, uniqueness: true, length: { maximum: 30 } 
    
end
