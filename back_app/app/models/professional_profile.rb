class ProfessionalProfile < ApplicationRecord
  belongs_to :user_profile

  has_many :comments, as: :page

  validates_associated :user_profile

  validates :registry, presence: true, uniqueness: true, length: { maximum: 25 }
  validates :ocupation, presence: true, length: { maximum: 50 }
  validates :user_profile_id, uniqueness: true
  validates :cpf, uniqueness: true, presence: true, length: { is: 11 }

  validate :cpf_digits

  scope :validated, -> { where(validation: true) }

  # Callbacks
  before_save :set_uppercase
  before_save :remove_useless_tags

  # Procura por profissionais a partir de um array de palavras que tenha em pelo
  # menos uma palavra em comum com o Array de lugares do profissional
  def self.by_places(*places)
    where("places @> ARRAY[:p]", p: places)
  end

  def self.by_services(*services)
    where("services @> ARRAY[:t]", t: services)
  end

  def self.by_ocupation(profession)
    where("ocupation = :o", o: profession)
  end

  def self.basic_search(*terms)
    joins('LEFT JOIN user_profiles
      ON professional_profiles.user_profile_id = user_profiles.id')
    .where("services && ARRAY[:t] or places && ARRAY[:t] or
      ocupation = ANY(ARRAY[:t]) or user_profiles.name ~ ANY(ARRAY[:t])", t: terms)
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

    # Callback pra garantir que os campos necessários estejam maiúsculos
    def set_uppercase
      self.ocupation.upcase!

      self.places.each do |place|
        place.upcase!
      end

      self.services.each do |service|
        service.upcase!
      end
    end

    def remove_useless_tags
      useless_tags = %w"A E O AS OS DA DE DO DAS DOS COM SEM EM"
      self.services -= useless_tags
    end

end
