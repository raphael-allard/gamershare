FactoryBot.define do
  factory :user do
    email { "test@gmail.com" }
    password { "azerty" }
    username { "test" }
    address { "5 rue erard, Paris"}
  end
end
