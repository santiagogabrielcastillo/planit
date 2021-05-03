require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'has a valid factory' do
    expect(build(:service)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:cost) }
  end

  describe 'associations' do
    it { should belong_to(:provider) }
    it { should have_one_attached(:photo) }
  end
end
