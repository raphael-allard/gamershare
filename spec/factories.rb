FactoryBot.define do
  factory :user do
    email { "test@gmail.com" }
    password { "azerty" }
    username { "test" }
    city { "Paris"}
  end

  factory :game do
    title { "Mega Man X" }
    nostalgia_point { 9 }
    platform { "Super Nintendo" }
    developer { "Capcom" }
    release_date { Date.new(1994,1,1) }
    game_mode { "Single player" }
    genre { ["Adventure", "Platform", "Shooter"] }
    association :owner, factory: :user
  end
end
