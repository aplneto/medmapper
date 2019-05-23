require 'faker'

FactoryBot.define do
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
    sex { 'm' }
    telephone { '81123456789'}
    email { 'its@cin.ufpe.br'}
  end

  factory :hospital do
    cnes { 0000656 }
    name { "HOSPITAL SANTO AMARO (IRMANDADE DA SANTA CASA DE MISERICORDIA DO RECIFE)" }
    telephone { "8134123800" }
    # phone { "8134123800" }
    address { "AVENIDA CRUZ CABUGA, 1563" }
    neighborhood { "SANTO AMARO" }
    latitude { -8.0424693 }
    longitude { -34.873336 }
    type { "Hospital" }
  end
end
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      build(factory_name).should be_valid
    end
  end
end
