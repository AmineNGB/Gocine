FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user_#{n}@example.com" }
    prenom { "John" }
    nom { "Doe" }
    phone { "0612121212" }
    password { "password" }
    confirmed_at { Date.today }
  end
end
