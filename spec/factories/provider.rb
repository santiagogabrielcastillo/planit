FactoryBot.define do
  factory :provider do
    name { 'La Pasionaria Cocina' }
    address { 'Reconquista 2827, Montevideo' }
    description {
      'Artesanía Pastelera es una empresa dedicada a la elaboración de catering
      y postres finos para grandes y pequeños eventos.
      Se encuentra certificada para la elaboración de productos libres de gluten.'
    }
    schedule { "08:00 a 21:00" }

    after(:build) do |provider|
      provider.services << create(:service, provider: provider)
    end

    factory :provider_with_categories do
      transient do
        categories_count { 1 }
      end

      after(:create) do |provider, evaluator|
        create_list(:category, evaluator.categories_count, providers: [provider])

        provider.reload
      end
    end
  end
  # def provider_with_categories(categories_count: 5)
  #   FactoryBot.create(:provider) do |provider|
  #     FactoryBot.create_list(:category, categories_count, providers: [provider])
  #   end
  # end
end
