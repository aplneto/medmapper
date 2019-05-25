require 'faker'

FactoryBot.define do
  factory :service_provider do
    name { "MyString" }
    address { "MyString" }
    neighborhood { "MyString" }
    phone { "MyString" }
    user { FactoryBot.build(:user) }
    description { "MyText" }
  end

  factory :comment do
    user { FactoryBot.build(:user) }
    body { Faker::Lorem.paragraphs }
    page { FactoryBot.build(:health_unit)}
  end

  factory :service do
    provider { FactoryBot.build(:professional) }
    tag { "Web developer" }
  end

  factory :contact do
    professional { FactoryBot.build(:professional) }
    category { "Instagram" }
    info { "aplneto" }
  end

  factory :place do
    professional { FactoryBot.build(:professional) }
    place { "Recife" }
  end

  factory :administrator do
    user { FactoryBot.build(:user) }
  end

  factory :collaborator do
    user { FactoryBot.build(:user) }
  end

  factory :professional do
    user { FactoryBot.build(:user) }
    registry { "12345678910" }
    ocupation { "Developer" }
    validation { true }
  end

  factory :user do
    user_name { "aplneto" }
    email { "apln2@cin.ufpe.br" }
    sex { "m" }
    birthday { "1995-04-03" }
    encrypted_password { "MyString" }
    name { "Antônio" }
    phone { "81123456789" }
    description { "Desenvolvedor" }
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

  factory :specialty do
    health_unit { FactoryBot.build(:health_unit) }
    specialty { "Atendimento Pediátrico" }
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

  factory :treatment do
    health_unit { FactoryBot.build(:health_unit) }
    treatment { "Pediatria" }
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
  end

end
FactoryBot.factories.map(&:name).each do |factory_name|
  describe "The #{factory_name} factory" do
    it 'is valid' do
      build(factory_name).should be_valid
    end
  end
end
