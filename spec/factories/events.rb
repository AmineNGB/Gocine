FactoryBot.define do
  factory :event do
    schedule { 19 }
    date { Date.today }
    endschedule { 21 }
    association :seance, factory: :seance
    association :cinema, factory: :cinema
  end
end
