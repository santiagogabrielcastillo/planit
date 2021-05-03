FactoryBot.define do
  factory :service do
    name { 'Brunch completo' }
    description { 'Scones de queso, medialunas, licuados, opciones de cafetería' }
    cost { 550 }
    provider
  end
end
