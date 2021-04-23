DELIVERY = ["Entrega a domicilio", "Retiro por el local"]

class Order < ApplicationRecord
  belongs_to :service
  belongs_to :user
end
