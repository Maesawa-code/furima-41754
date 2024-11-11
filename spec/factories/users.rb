FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.unique.email }
    password              { 'password1' }
    password_confirmation { password }
    last_name             { Faker::Name.last_name }
    first_name            { Faker::Name.first_name }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'リクタロウ' }
    birth_date            { Faker::Date.birthday(min_age: 20, max_age: 60) }
  end
end
