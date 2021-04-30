FactoryBot.define do
  factory :provider do
    name { "La Pasionaria Cocina" }
    address { "Reconquista 2827, Montevideo" }
    description { "Artesanía Pastelera es una empresa dedicada a la elaboración de catering y postres finos para grandes y pequeños eventos. Se encuentra certificada para la elaboración de productos libres de gluten." }
    schedule { "08:00 a 21:00" }
  end

  def provider_with_categories(categories_count: 5)
    FactoryBot.create(:provider) do |provider|
      FactoryBot.create_list(:category, categories_count, providers: [provider])
    end
  end
end
