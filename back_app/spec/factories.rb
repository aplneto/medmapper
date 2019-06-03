require 'faker'

FactoryBot.define do
  factory :family_health_support_center do
    team { "ENASF 1.1" }
    support_point { "USF SÃO JOSÉ DO COQUE" }
    name { "USF 278 - PSF NOSSA SENHORA DO PILAR BAIRRO DO RECIFE" }
    area { "PILAR" }
    phone { "3355-6226" }
    latitude { -8.072817109 }
    longitude { -34.8962775 }
    district { 1 }
  end

  factory :service_provider do
    name { "3virgula14.ga" }
    address { "Av Jornalista Anibal Fernandes, 4" }
    neighborhood { "Cidade Universitária" }
    phone { "912345678" }
    user_profile { FactoryBot.build(:user_profile) }
    latitude { 1.5 }
    longitude { 1.5 }
    description { Faker::Lorem.paragraphs }
  end

  factory :comment do
    user_profile { FactoryBot.build(:user_profile) }
    body { "MyText" }
    page { FactoryBot.build(:health_unit) }
  end

  factory :user_profile do
    name { "Antônio" }
    sex { "m" }
    birthday { "2019-05-28" }
    phone { "8100000000" }
    description { "Developer" }
    account { FactoryBot.build(:account) }
  end

  factory :account do
    email { "test_user@testdomain.com" }
    password { "my_password" }
    password_confirmation { "my_password" }
    after(:build) { |u| u.skip_confirmation_notification! }
    after(:create) { |u| u.confirm }
  end

  factory :health_unit do
    cnes { 1 }
    name { "FACTORY BOT HOSPITAL" }
    address { "Factory bot street, 0" }
    neighborhood { "Unknown neighborhood" }
    phone { "1112345678" }
    latitude { 1.5 }
    longitude { 1.5 }
    description { Faker::Lorem.paragraphs }
    specialties { ['pediatria', 'cardiologia'] }
    treatments { ['pediatra', 'psicólogo'] }
    state { 'Pernambuco' }
    city { 'Recife' }
    category { 'Public' }
    
    factory :hospital do
      type { 'Hospital' }
    end

    factory :pharmacy do
      type { 'Pharmacy' }
    end

    factory :specialized_unit do
      type { 'SpecializedUnit' }
    end

    factory :basic_health_unit do
      type { 'BasicHelathUnit' }
    end

    factory :maternity_clinic do
      type { "MaternityClinic" }
    end
  
    factory :mental_health_unit do
      type { "MentalHealthUnit" }
    end
  
    factory :odontology_unit do
      type { "OdontologyUnit" }
    end
  
    factory :emergency_unit do
      type { "EmergencyUnit" }
    end
  
    factory :diagnosis_unit do
      type { "DiagnosisUnit" }
    end
  
    factory :polyclinic do
      type { "Polyclinic" }
    end
  
    factory :family_health_unit do
      type { "FamilyHealthUnit" }
    end
  end

end
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      build(factory_name).should be_valid
    end
  end
end