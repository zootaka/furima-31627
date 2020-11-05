FactoryBot.define do
  factory :user do
    first_name            { '一宇' }
    last_name             { '田中' }
    first_name_kana       { 'アア' }
    last_name_kana        { 'アア' }
    nickname              { Faker::Name.initials(number: 2) }
    birth_date            { Faker::Date.backward }
    email                 { Faker::Internet.free_email }
    password              { 'aaaaa1' }
    password_confirmation { password }
  end
end
