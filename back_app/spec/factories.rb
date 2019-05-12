require 'faker'

FactoryBot.define do
  factory :local do
    
  end

  factory :contact do
    
  end

  factory :area do
    
  end

  factory :professional do
    
  end

  factory :user do
    login { 'its' }
    #encrypted_password { '' }
    name { 'Isac Tomaz da Silva' }
    sex { 'f' }
    telephone { '81123456789'}
    email { 'its@cin.ufpe.br'}
  end

  factory :hospital do
    name { "HOSPITAL SANTO AMARO (IRMANDADE DA SANTA CASA DE MISERICORDIA DO RECIFE)" }
    telephone { "8134123800" }
    address { "AVENIDA CRUZ CABUGA, 1563" }
    neighborhood { "SANTO AMARO" }
    latitude { "-8.0424693" }
    longitude { "-34.873336" }
    region { "1" }
    micro_region { "1" }
    nature { "CONVENIADO" }
    specialties { "CLINICA MEDICA E CLINICA CIRURGICA" }
  end
end