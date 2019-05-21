require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  subject { described_class.new(
    cnes: 0000655, name: 'GENERIC HOSPITAL NAME',
    phone: '0123456789', neighborhood: 'GENERIC NEIGHBORHOOD',
    address: 'GENERIC ADDRESS S/N', latitude: 123546789,
    longitude: 123456789, type: 'Pharmacy') }
  describe 'Model basic functioning' do
    it 'should be valid' do
      expect(subject).to be_valid
    end
  end
end
