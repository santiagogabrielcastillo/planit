require 'rails_helper'

RSpec.describe Order, type: :model do
  it 'has a valid factory' do
    expect(build(:order)).to be_valid
  end

  describe 'validations' do
    it { should validate_numericality_of(:guests) }
  end

  describe 'associations' do
    it { should belong_to(:service) }
    it { should belong_to(:user) }
  end
end
