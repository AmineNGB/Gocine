require "open-uri"
require "nokogiri"
require "awesome_print"

# cinemas = Cinema.all
# cinemas.each do |cinema|
# cinema.create_movies
# end
"Cleaning DataBase"
User.destroy_all
Seance.destroy_all
Favorite.destroy_all
Cinema.destroy_all
Event.destroy_all
# "User in progress ..."
# user = User.new
# user.email = "amine@gmail.com"
# user.password = "password"
# user.nom = "Neghbel"
# user.prenom = "Amine"
# user.phone = "06xxxxxxxx"
# user.save!

# user2 = User.new
# user2.email = "nico@gmail.com"
# user2.password = "password"
# user2.nom = "Iniesta"
# user2.prenom = "Nicolas"
# user2.phone = "07xxxxxxxx"
# user2.save!

# user3 = User.new
# user3.email = "boule@gmail.com"
# user3.password = "password"
# user3.nom = "Bou"
# user3.prenom = "Boule"
# user3.phone = "07xxxxxxxx"
# user3.save!

# user4 = User.new
# user4.email = "jules@gmail.com"
# user4.password = "password"
# user4.nom = "Ju"
# user4.prenom = "Jules"
# user4.phone = "07xxxxxxxx"
# user4.save!

"Creation des films à l\'affiche"

cinema_attributes = [
  # {
  #   name: 'Les Amphis',
  #   ville: 'Vaulx-en-Velin',
  #   allocine_id: 'P0013'
  # },
  {
    name: "Pathé - Bellecour",
    ville: "Lyon",
    allocine_id: "P0012",
  },
  {
    name: "UGC Ciné Cité",
    ville: "Lyon",
    allocine_id: "P0671",
  },
  {
    name: "Pathé - Vaise",
    ville: "Lyon",
    allocine_id: "P6909",
  },
  {
    name: "Pathé - Carré de Soie",
    ville: "Vaulx-en-Velin",
    allocine_id: "P8507",
  },
]

cinema_attributes.each do |attr|
  ap "---------------------------"
  cinema = Cinema.create!(attr)
  ap attr[:name]
  cinema.create_movies
  ap "---------------------------"
end

# favorites_attributes = [
#   {
#     user_id: user.id,
#     film_id: 7,
#   },
#   {
#     user_id: user.id,
#     film_id: 14,
#   },
#   {
#     user_id: user.id,
#     film_id: 3,
#   },
#   {
#     user_id: user.id,
#     film_id: 4,
#   },
#   {
#     user_id: user2.id,
#     film_id: 7,
#   },
#   {
#     user_id: user2.id,
#     film_id: 10,
#   },
#   {
#     user_id: user2.id,
#     film_id: 3,
#   },
#   {
#     user_id: user2.id,
#     film_id: 4,
#   },
#   {
#     user_id: user3.id,
#     film_id: 2,
#   },
#   {
#     user_id: user3.id,
#     film_id: 11,
#   },
#   {
#     user_id: user3.id,
#     film_id: 3,
#   },
#   {
#     user_id: user3.id,
#     film_id: 4,
#   },
#   {
#     user_id: user4.id,
#     film_id: 5,
#   },
#   {
#     user_id: user4.id,
#     film_id: 11,
#   },
#   {
#     user_id: user4.id,
#     film_id: 1,
#   },
#   {
#     user_id: user4.id,
#     film_id: 4,
#   },
# ]

# Favorite.create!(favorites_attributes)

# events_attributes = [
#   {
#     schedule: :matin,
#     date: DateTime.strptime("15/03/2020", "%d/%m/%Y"),
#     cinema_id: 4,
#     seance_id: 44,
#   },
# ]
# "creation evenements"
# Event.create!(events_attributes)

# Guest.create!(user_id: 1, event_id: 1, status: 1)
# Guest.create!(user_id: 2, event_id: 1, status: 1)
# Guest.create!(user_id: 3, event_id: 1, status: 0)
# Guest.create!(user_id: 4, event_id: 1, status: 2)

# user.friend_request(user2)
# user2.accept_request(user)

# user.friend_request(user3)
# user3.accept_request(user)

# user.friend_request(user4)
# user4.accept_request(user)

# user2.friend_request(user3)
# user3.accept_request(user2)

# user2.friend_request(user4)
# user4.accept_request(user2)

# user3.friend_request(user4)
# user4.accept_request(user3)

# ap Favorite.all

# ap Event.all
