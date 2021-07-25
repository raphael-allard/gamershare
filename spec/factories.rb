FactoryBot.define do
  factory :user do
    email
    password { "azerty" }
    username
    city { "Paris"}
  end

  sequence :email do |n|
    "test#{n}@gmail.com"
  end

  sequence :username do |n|
    "test-#{n}"
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

  factory :favorite do
    user
    game
  end
end
