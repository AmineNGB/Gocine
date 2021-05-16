FactoryBot.define do
  factory :favorite do
    position { 1 }

    association :user, factory: :user
    association :film, factory: :film
  end
end
