FactoryBot.define do
  factory :film do
    photo_url { "http://www.picture.com" }
    title { "harry potter" }
    synopsis { "text" }
    duration { "2h30" }
    genre { ["Action", "Thriller"] }
    rate_press { 1.2 }
    rate_viewer { 2.3 }
    date_release { Date.today }
    allocine_id { "allocine_id" }

    association :seance, factory: :seance
    association :cinema, factory: :cinema
  end
end
