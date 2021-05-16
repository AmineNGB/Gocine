FactoryBot.define do
  factory :guest do
    status { 0 }

    association :user, factory: :user
    association :event, factory: :event
  end
end
