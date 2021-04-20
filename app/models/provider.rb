CATEGORIES = ["Tutorial", "Pastelería", "Foodtrucks", "Barras de tragos", "Salones",
              "Fotografía", "Bebidas", "Música", "Cotillón", "Animación", "Mozos", "Vajilla",
              "Seguridad", "Mobiliario", "Catering"]

DELIVERY = ["Entrega a domicilio", "Retiro en el local"]

class Provider < ApplicationRecord
  has_many :services
  has_and_belongs_to_many :categories
end
