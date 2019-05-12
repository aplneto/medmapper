class Local < ApplicationRecord
    validates :local, uniqueness: true, length: { maximum: 30 }
    validates :register, uniqueness: true, length: { maximum: 20 }
    belongs_to :professional
end
