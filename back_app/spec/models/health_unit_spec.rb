require 'rails_helper'

RSpec.describe HealthUnit, type: :model do
  subject { FactoryBot.build(:health_unit) }
  describe 'Model validations' do
    it 'should be valid if all the attributes are present' do
      expect(subject).to be_valid
    end
    it 'should not be valid if the cnes is missing' do
      subject.cnes = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if cnes is not a numerical value' do
      subject.cnes = 'meia cinco cinco'
      expect(subject).to_not be_valid
    end
    it 'should not be valid when name is missing' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if name is longer than 100 characters' do
      subject.name = 'o'*101
      expect(subject).to_not be_valid
    end
    it 'should be valid even if there is no phone value' do
      subject.phone = nil
      expect(subject).to be_valid
    end
    it 'should not be valid if phone attribute is longer than 25' do
      subject.phone = '4'*26
      expect(subject).to_not be_valid
    end
    it 'should not be valid with no address' do
      subject.address = nil
      expect(subject).to_not be_valid
    end
    it 'should not be vaild without a neighborhood attribute' do
      subject.neighborhood = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if there is no latitude attribute' do
      subject.latitude = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if there is no longitude attribute' do
      subject.longitude = nil
      expect(subject).to_not be_valid
    end
  end
end
