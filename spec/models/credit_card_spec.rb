require 'rails_helper'

RSpec.describe CreditCard, type: :model do
  it 'has a valid factory' do
    expect(build(:credit_card)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:expire) }
    it { should validate_length_of(:number) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
  end
end
