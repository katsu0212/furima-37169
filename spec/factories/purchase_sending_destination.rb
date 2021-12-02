FactoryBot.define do
  factory :purchase_sending_destination do
    post_code   {"123-4567"}
    region_id   { 2 }
    city        {"川越市"}
    block       {"仙波町"}
    building_name {"ハイツ川越"}
    phone_number  {"08012345678"}
    token       {"tok_abcdefghijk00000000000000000"}
  end
end
