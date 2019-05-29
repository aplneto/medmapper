class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :omniauthable
  
  has_one :user_profile

  validates_acceptance_of :terms, accept: "1",
    message: "Você deve concordar com os nossos termos para continuar"
end
