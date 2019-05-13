class Commentary < ApplicationRecord
    validates :comentary, uniqueness: true, length: { maximum: 140 }
    belongs_to :hospital
end
