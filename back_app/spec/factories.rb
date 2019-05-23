require 'faker'

FactoryBot.define do
  factory :maternity_clinic do
    
  end

  factory :mental_health_unit do
    
  end

  factory :odontology_unit do
    
  end

  factory :emergency_unit do
    
  end

  factory :diagnosis_unit do
    
  end

  factory :polyclinc do
    
  end

  factory :family_health_unit do
    
  end

  factory :specialty do
    
  end

  factory :specialized_unit do
    
  end

  factory :basic_health_unit do
    
  end


  factory :pharmacy do
    
  end

  factory :commentary do
    
  end

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
    cnes { 0000656 }
    name { "HOSPITAL SANTO AMARO (IRMANDADE DA SANTA CASA DE MISERICORDIA DO RECIFE)" }
    telephone { "8134123800" }
    address { "AVENIDA CRUZ CABUGA, 1563" }
    neighborhood { "SANTO AMARO" }
    latitude { -8.0424693 }
    longitude { -34.873336 }
    type { "Hospital" }
  end
end