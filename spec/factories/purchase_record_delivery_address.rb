FactoryBot.define do
  factory :purchase_record_delivery_address do
    postal_code     { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    prefecture_id   { Faker::Number.between(from: 2, to: 47) }
    city            { Faker::Address.city }
    address         { Faker::Address.street_address }
    building_name   { Faker::Address.secondary_address }
    phone_number    { Faker::Number.leading_zero_number(digits: 11) }
    token           { "tok_#{Faker::Alphanumeric.alphanumeric(number: 24)}" }
  end
end
