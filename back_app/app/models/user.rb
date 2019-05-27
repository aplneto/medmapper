class User < ApplicationRecord
    devise :database_authenticatable, :registerable, :confirmable, :recoverable,
        stretches: 12
    has_one :professional
    has_one :collaborator
    has_one :administrator

    has_many :comments
    has_many :service_providers
end
