puts "Cleaning data..."

Service.destroy_all
Provider.destroy_all

puts "Creating data..."

DELIVERY = ["Entrega a domicilio", "Retiro en el local"]

CATEGORIES.each do |category|
  3.times do
    Provider.create!(
      name: Faker::Company.name,
      address: Faker::Address.street_address,
      description: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 15),
      delivery: DELIVERY.sample,
      schedule: "#{rand(7..10)}:00 a #{rand(18..21)}:00",
      category: category
    )
  end
end
