require 'rails_helper'

RSpec.describe FamilyHealthUnit, type: :model do
  subject { FactoryBot.build(:family_health_unit) }

  describe 'Model Validations' do
    it "should be valid with valid parameters" do
      expect(subject).to be_valid
    end
    it "should not be valid without an associated health_unit" do
      subject.health_unit = nil
      expect(subject).to_not be_valid
    end
    it "should not be valid if there is no type column" do
      subject.type = ''
      expect(subject).to_not be_valid
    end
    it "should not be valid if type is different from 'FamilyHealthUnity'" do
      subject.type = 'SomethingElse'
      expect(subject).to_not be_valid
    end
    it 'should not be valid if health_unit associated is not unique' do
      family_health_unit = FactoryBot.create(:family_health_unit)
      subject.health_unit_id = family_health_unit.health_unit_id
      expect(subject).to_not be_valid
    end
  end
end
