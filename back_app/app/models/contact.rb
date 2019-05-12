class Contact < ApplicationRecord
    validates :contact, uniqueness: true, length: { maximum: 100 }
    validates :register, uniqueness: true, length: { maximum: 20 }
    belongs_to :professional
end
