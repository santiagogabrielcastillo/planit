FactoryBot.define do
  factory :credit_card do
    number { '4545-6565-8989-7485' }
    user
    name { user.name }
    expire { "#{rand(01..12)}/#{rand(22..30)}" }
  end
end
