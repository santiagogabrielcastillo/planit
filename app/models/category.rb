CATEGORIES = ["Tutorial", "Pastelería", "Foodtrucks", "Barras de tragos", "Salones",
  "Fotografía", "Bebidas", "Música", "Cotillón", "Animación", "Mozos", "Vajilla",
  "Seguridad", "Mobiliario", "Catering"]

class Category < ApplicationRecord
  has_and_belongs_to_many :providers
end
