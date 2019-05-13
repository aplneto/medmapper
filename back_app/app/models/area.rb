class Area < ApplicationRecord
    validates :area, uniqueness: true, length: { maximum: 30 }
    belongs_to :professional
end
