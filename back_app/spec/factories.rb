require 'faker'

FactoryBot.define do
  factory :professional_profile do
    registry { "MyString" }
    ocupation { "MyString" }
    validation { false }
    contacts { "MyText" }
    places { "MyText" }
    services { "MyText" }
    cpf { "MyString" }
    user_profile { nil }
  end

  factory :service_provider do
    name { "MyString" }
    address { "MyString" }
    neighborhood { "MyString" }
    phone { "MyString" }
    user_profile { nil }
    latitude { 1.5 }
    longitude { 1.5 }
    description { "MyText" }
  end

  factory :comment do
    user_profile { nil }
    body { "MyText" }
    page_id { 1 }
    page_type { "MyString" }
  end

  factory :user_profile do
    name { "MyString" }
    sex { "MyString" }
    birthday { "2019-05-28 15:05:39" }
    phone { "MyString" }
    description { "MyText" }
    account { nil }
  end

  factory :account do
    
  end

  factory :maternity_clinic do
    health_unit { FactoryBot.build(:health_unit) }
    type { "MaternityClinic" }
  end

  factory :mental_health_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "MentalHealthUnit" }
  end

  factory :odontology_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "OdontologyUnit" }
  end

  factory :emergency_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "EmergencyUnit" }
  end

  factory :diagnosis_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "DiagnosisUnit" }
  end

  factory :polyclinic do
    health_unit { FactoryBot.build(:health_unit) }
    type { "Polyclinic" }
  end

  factory :family_health_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "FamilyHealthUnit" }
  end

  factory :basic_health_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "BasicHealthUnit" }
  end

  factory :specialized_unit do
    health_unit { FactoryBot.build(:health_unit) }
    type { "SpecializedUnit" }
  end

  factory :pharmacy do
    health_unit { FactoryBot.build(:health_unit) }
  end


  factory :hospital do
    health_unit { FactoryBot.build(:health_unit) }
    type { "Hospital" }
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
  end

end
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      build(factory_name).should be_valid
    end
  end
end
