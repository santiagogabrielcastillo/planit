DELIVERY = ["A domicilio", "Retiro en local"]

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :guests, numericality: { greater_than_or_equal_to: 1 }
end
