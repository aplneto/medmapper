require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  subject { FactoryBot.build(:user_profile) }

  describe 'Model basic funcionality' do
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
