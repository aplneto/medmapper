require 'faker'

FactoryBot.define do
    factory :hospital do
        register 1234567
        name "Hospital Padre Inacio"
        telephone "8112345678"
        street "Avenida A"
        number 420
        neighborhood "Quebrada"
        latitude ""
        longitude ""
        region ""
        nature ""
        type ""
    end
end