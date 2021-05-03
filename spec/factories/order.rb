FactoryBot.define do
  factory :order do
    guests { 10 }
    delivery { 'A domicilio' }
    address { 'Sarmiento 3268' }
    apartment { '5A' }
    date { Date.today.strftime('%Y-%m-%d') }
    from { '08:00:00' }
    to { '21:00:00' }
    service
    user
  end
end
