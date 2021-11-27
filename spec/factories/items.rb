FactoryBot.define do
  factory :item do
    image         {Faker::Lorem.sentence}
    name                {"テスト"}
    introduction        {"テストです"}
    category_id         {2}
    item_condition_id   {2}
    postage_id          {2}
    region_id           {2}
    preparation_day_id  {2}
    price               {500}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),filename: 'test_image.png')
    end
  end
end
