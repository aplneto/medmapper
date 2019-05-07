require 'faker'

FactoryBot.define do
    factory :hospital do
        register { 2777460 }
        name { "HOSPITAL SANTO AMARO (IRMANDADE DA SANTA CASA DE MISERICORDIA DO RECIFE)" }
        telephone { "8134123800" }
        street { "AVENIDA CRUZ CABUGA" }
        number { 1563 }
        neighborhood { "SANTO AMARO" }
        latitude { "-8.0424693" }
        longitude { "-34.873336" }
        region { "1" }
        nature { "CONVENIADO" }
        type { "CLINICA MEDICA E CLINICA CIRURGICA" }
    end
end