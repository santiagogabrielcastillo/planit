require 'rails_helper'

RSpec.describe Provider, type: :model do
  it 'has a valid factory' do
    expect(build(:provider)).to be_valid
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:address) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:schedule) }
  end

  describe 'associations' do
    it { should have_many(:services) }
    it { should have_and_belong_to_many(:categories) }
    it { should have_one_attached(:photo) }
  end
end
