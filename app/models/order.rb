DELIVERY = ["A domicilio", "Retiro en local"]

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :guests, numericality: { greater_than_or_equal_to: 1 }

  validates :date, :from, :to, presence: true, on: :update

  validates :address, presence: true, on: :update, if: :delivery_home?

  def delivery_home?
    delivery == 'A domicilio'
  end
end
