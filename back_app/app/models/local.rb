class Local < ApplicationRecord
    validates :local, uniqueness: true, length: { maximum: 30 }
    belongs_to :professional
end
