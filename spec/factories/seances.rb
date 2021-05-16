FactoryBot.define do
  factory :seance do
    link { "http://www.link.fr" }
    horaire { Date.today }
    allocine_id { "123456789" }
    association :film, factory: :film
    association :cinema, factory: :cinema
  end
end
