class Category < ApplicationRecord
  has_and_belongs_to_many :providers

  validates :name, presence: true
end
