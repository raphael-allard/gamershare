FactoryBot.define do
  factory :user do
    email { "test@gmail.com" }
    password { "azerty" }
    username { "test" }
    city { "Paris"}
  end
end
