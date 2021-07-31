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
    name { "Mega Man X" }
    nostalgia_point { 9 }
    platform { "Super Nintendo" }
    developers { ["Capcom"] }
    release_date { Date.new(1994,1,1) }
    game_modes { ["Single player"] }
    genres { ["Adventure", "Platform", "Shooter"] }
    association :owner, factory: :user
  end

  factory :favorite do
    user
    game
  end

  factory :trade do
    association :asker, factory: :user
    association :receiver, factory: :user
  end
  
  factory :trade_game do
    trade
    game
  end
  
  factory :conversation do
    association :first_participant, factory: :user
    association :second_participant, factory: :user
  end

  factory :message do
    content { "I love this game!" }
    conversation
    user
  end
end
