require 'rails_helper'

RSpec.describe Hospital, type: :model do
  subject { described_class.new(
    cnes: 0000655, name: 'GENERIC HOSPITAL NAME',
    phone: '0123456789', neighborhood: 'GENERIC NEIGHBORHOOD',
    address: 'GENERIC ADDRESS S/N', latitude: 123546789,
    longitude: 123456789, type: 'Hospital') }
  describe 'Model basic functioning' do
    it 'should not have any row in it' do
      expect(Hospital.count).to eq(0)
    end
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
    it 'should not be valid if name is longer than 80 characters' do
      subject.name = 'o'*81
      expect(subject).to_not be_valid
    end
    it 'should not be valid if there is no phone attribute' do
      subject.phone = nil
      expect(subject).to_not be_valid
    end
    it 'should not be valid if phone attribute is shorther than 10 characters' do
      subject.phone = '4'*9
      expect(subject).to_not be_valid
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
    it 'should not be valid if there is no type column' do
      subject.type = nil
      expect(subject).to_not be_valid
    end
    it 'should have one row after the creation of one element' do
      subject.save
      expect(Hospital.count).to eq(1)
    end
  end
end
