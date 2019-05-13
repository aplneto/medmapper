require 'rails_helper'

RSpec.describe Hospital, type: :model do
  subject { described_class.new(name: 'GENERIC HOSPITAL NAME',
    telephone: '0123456789', neighborhood: 'GENERIC NEIGHBORHOOD',
    address: 'GENERIC ADDRESS S/N', latitude: '000000000000',
    longitude: '00000000000', region: 0, micro_region: 1, nature: "TESTING",
    specialties: "ALOT, OF E SPECIALTIES") }
  describe 'Model basic functioning' do
    it 'should not have any row in it' do
      expect(Hospital.count).to eq(0)
    end
    it 'should be valid if all the attributes are present' do
      expect(subject).to be_valid
    end
    it 'should not be valid when name is missing' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if there is no telephone attribute' do
      subject.telephone = nil
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
    it 'should not be valid if region is not an integer' do
      subject.region = 'a'
      expect(subject).to_not be_valid
    end
    it 'should not be valid if region is not present' do
      subject.region = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid without a nature field' do
      subject.nature = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid without a specialties field' do
      subject.specialties = nil
      expect(subject).to_not be_valid
    end
    it 'should have one row after the creation of one element' do
      subject.save
      expect(Hospital.count).to eq(1)
    end
  end
end
