class UserProfile < ApplicationRecord
  belongs_to :account
  
  has_many :comments

  has_one :service_provider

  validates :name, presence: true, length: { maximum: 100 }
  validates :sex, length: { maximum: 1 }
  validates :phone, length: { minimum: 8, maximum: 20}
  validates :description, length: { maximum: 240 }
  validates :account_id, uniqueness: true
  validate :birthday_value

  validates_associated :account

  private
    def birthday_value
      if birthday.present? and birthday > Date.today
        errors.add(:birthday, "#{birthday} é uma data inválida")
      end
    end

end
