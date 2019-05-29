class ProfessionalProfile < ApplicationRecord
  belongs_to :user_profile

  has_many :comments, as: :page
end
