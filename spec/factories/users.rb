FactoryBot.define do
  factory :user do
    first_name            {Faker::Name.first_name}
    last_name             {Faker::Name.last_name}
    first_name_kana       { "アア" }
    last_name_kana        { "アア" }
    nickname              {Faker::Name.initials(number: 2)}
    birth_date            {Faker::Date.backward }
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end