class Provider < ApplicationRecord
  has_many :services
  has_and_belongs_to_many :categories

  has_one_attached :photo

  validates :name, :address, :description, :schedule, presence: true
end
