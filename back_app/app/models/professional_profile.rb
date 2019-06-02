class ProfessionalProfile < ApplicationRecord
  belongs_to :user_profile

  has_many :comments, as: :page

  validates_associated :user_profile

  validates :registry, presence: true, length: { maximum: 25 }
  validates :ocupation, presence: true, length: { maximum: 50 }
  validates :valiation, presence: true,
  validates :user_profile_id, uniqueness: true
  validates :cpf, uniqueness: true, presence: true, length: { maximum: 11 }

  scope :validated, -> { where(validation: true) }

  # Procura por profissionais a partir de um array de palavras que tenha em pelo
  # menos uma palavra em comum com o Array de lugares do profissional
  def self.by_places(*places)
    where("places %% ARRAY[:places];")
  end

end
