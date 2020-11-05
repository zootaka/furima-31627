FactoryBot.define do
  factory :item do
    name {Faker::Team.name}
    association :user
    description {Faker::Lorem.sentence}
    category_id {"3"}
    condition_id {"3"}
    postage_payer_id {"3"}
    prefecture_id {"3"}
    handling_time_id {"5"}
    price {500}

    after(:build) do |item|
      item.image.attach(io: File.open(
        'public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
