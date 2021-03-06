puts "Cleaning data..."

Service.destroy_all
Provider.destroy_all
Category.destroy_all

puts "Creating data..."


CATEGORIES = ["Tutorial", "Pastelería", "Foodtrucks", "Barras de tragos", "Salones",
              "Fotografía", "Bebidas", "Música", "Cotillón", "Animación", "Mozos", "Vajilla",
              "Seguridad", "Mobiliario", "Catering"]

CATEGORIES.each do |category|
  Category.create!(name: category)
end

Category.all.each do |category|
  3.times do
    p = Provider.create!(
      name: Faker::Company.name,
      address: Faker::Address.street_address,
      description: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 15),
      schedule: "#{rand(7..10)}:00 a #{rand(18..21)}:00"
    )
    p.categories << category
  end
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
