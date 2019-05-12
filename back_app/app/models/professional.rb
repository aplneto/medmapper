class Professional < User
    validates :occupation, length: { maximum: 25 }
    validates :register, uniqueness: true, length: { maximum: 20 }
    validates :description, length: { maximum: 140 }
    validates :homecare, presence: true
    has_many :areas
    has_many :contacts
    has_many :locals
end