class Comment < ApplicationRecord
  belongs_to :user_profile

  belongs_to :page, polymorphic: true

  validates_associated :user_profile
  
  validates :body, presence: true, length: { maximum: 300 }

end
