class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :guests, :delivery, :date, presence: true
end
