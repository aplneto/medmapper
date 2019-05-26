class ServiceProvider < ApplicationRecord
  belongs_to :user

  has_many :comments, as: :page
end
