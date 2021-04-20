CATEGORIES = ["Tutorial", "Pastelería", "Foodtrucks", "Barras de tragos", "Salones",
              "Fotografía", "Bebidas", "Música", "Cotillón", "Animación", "Mozos", "Vajilla",
              "Seguridad", "Mobiliario", "Catering"]

class Provider < ApplicationRecord
  has_many :services

  validates :category, inclusion: { in: CATEGORIES }
end
