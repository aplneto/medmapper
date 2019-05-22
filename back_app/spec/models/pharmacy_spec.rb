require 'rails_helper'

RSpec.describe Pharmacy, type: :model do
  subject { described_class.new(
    cnes: 0000655, name: 'GENERIC PHARMACY NAME',
    phone: '0123456789', neighborhood: 'GENERIC NEIGHBORHOOD',
    address: 'GENERIC ADDRESS S/N', latitude: 123546789,
    longitude: 123456789, type: 'Pharmacy') }
  describe 'Model basic functioning' do
    it 'should be valid if all the attributes are present' do
      expect(subject).to be_valid
    end
    it { is_expected.to validate_presence_of(:cnes) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:phone) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:type) }
  end
end
