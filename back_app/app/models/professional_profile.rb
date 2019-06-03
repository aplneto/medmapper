class ProfessionalProfile < ApplicationRecord
  belongs_to :user_profile

  has_many :comments, as: :page

  validates_associated :user_profile

  validates :registry, presence: true, uniqueness: true, length: { maximum: 25 }
  validates :ocupation, presence: true, length: { maximum: 50 }
  validates :validation, presence: true
  validates :user_profile_id, uniqueness: true
  validates :cpf, uniqueness: true, presence: true, length: { is: 11 }

  validate :cpf_digits

  scope :validated, -> { where(validation: true) }

  # Procura por profissionais a partir de um array de palavras que tenha em pelo
  # menos uma palavra em comum com o Array de lugares do profissional
  def self.by_places(*places)
    where("places %% ARRAY[:places];")
  end

  def cpf_digits
    unless cpf_is_valid?
      errors.add(:cpf, :invalid_cpf)
    end
  end

  private
    def cpf_is_valid?
      valid = 0
      9.times do |n|
        valid += (cpf[n].to_i)*(10-n)
      end
      dv = 11 - valid%11
      if dv > 9 then dv = 0 end
      valid = 0
      9.times do |n|
        valid += (cpf[n].to_i)*(11-n)
      end
      valid += dv*2
      dv2 = 11 - valid%11
      if dv2>9 then dv2 = 0 end
      cpf[9, 2] == dv.to_s+dv2.to_s
    end

end
