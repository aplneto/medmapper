require 'rails_helper'

RSpec.describe FamilyHealthUnit, type: :model do
  subject { described_class.new(
    cnes: 0000655, name: 'GENERIC FAMILY HEALTH UNIT VALID NAME',
    phone: '0123456789', neighborhood: 'GENERIC NEIGHBORHOOD',
    address: 'GENERIC ADDRESS S/N', latitude: 123546789,
    longitude: 123456789, type: 'FamilyHealthUnit') }
    it 'should be valid with all fields' do
      expect(subject).to  be_valid
    end
end