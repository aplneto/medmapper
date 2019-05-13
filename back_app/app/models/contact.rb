class Contact < ApplicationRecord
    validates :contact, uniqueness: true, length: { maximum: 100 }
    belongs_to :professional
end
