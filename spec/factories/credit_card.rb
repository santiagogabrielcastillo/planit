FactoryBot.define do
  factory :credit_card do
    number { Faker::Finance.credit_card(:mastercard, :visa) }
    user
    name { user.name }
    expire { "#{rand(01..12)}/#{rand(22..30)}" }
  end
end
