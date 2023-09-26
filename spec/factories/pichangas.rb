FactoryBot.define do
  factory :pichanga do
    home_team { nil }
    visitor_team { "MyString" }
    location_id { nil }
    instructions { "MyText" }
    game_date { "2022-02-23 21:53:20" }
  end
end
