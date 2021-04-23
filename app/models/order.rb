DELIVERY = ["A domicilio", "Retiro en local"]

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user
end
