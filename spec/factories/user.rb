FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { "John Doe" }
    password { '12345678' }
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
    admin { false }
  end
end
