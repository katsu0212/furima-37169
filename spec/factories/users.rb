FactoryBot.define do
  factory :user do
    nickname              {"momo"}
    last_name             {"ぜんかく"}
    first_name            {"ぜんかく"}
    last_name_kana        {"ゼンカクカナ"}
    first_name_kana      {"ゼンカクカナ"}
    birthday              {"2000-01-01"}
    email                 {Faker::Internet.free_email}
    password              {"abc1234"}
    password_confirmation {"abc1234"}

  end
end