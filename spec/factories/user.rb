FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { "John Doe" }
    password { '12345678' }
    phone { Faker::PhoneNumber.cell_phone_with_country_code }
    admin { false }

    after(:build) do |user|
      user.credit_cards << create(:credit_card, user: user)
    end
  end
end
