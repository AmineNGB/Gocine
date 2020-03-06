require 'open-uri'
require 'nokogiri'
require 'awesome_print'
"Cleaning DataBase"
User.destroy_all

user = User.new
user.email = 'amine@gmail.com'
user.password = 'password'
user.nom = 'Neghbel'
user.prenom = 'Amine'
user.phone = '06xxxxxxxx'
user.save!

user2 = User.new
user2.email = 'nico@gmail.com'
user2.password = 'password'
user2.nom = 'Iniesta'
user2.prenom = 'Nicolas'
user2.phone = '07xxxxxxxx'
user2.save!

"Creation des films à l\'affiche"

cinema_attributes = [
  {
    name: 'Les Amphis',
    ville: 'Vaulx-en-Velin',
    allocine_id: 'P0013'
  },
  {
    name: 'Pathé Lyon - Bellecour',
    ville: 'Lyon',
    allocine_id: 'P0012'
  },
  {
    name: 'UGC Ciné Cité Internationale',
    ville: 'Lyon',
    allocine_id: 'P0671'
  },
  {
    name: 'Pathé Lyon - Vaise',
    ville: 'Lyon',
    allocine_id: 'P6909'
  },
  {
    name: 'Pathé Lyon - Multiplexe Carré de Soie IMAX',
    ville: 'Vaulx-en-Velin',
    allocine_id: 'P8507'
  },
]


cinema_attributes.each do |attr|
  ap "---------------------------"
  cinema = Cinema.create!(attr)
  ap attr[:name]
  cinema.create_movies
  ap "---------------------------"

end


favorites_attributes = [
  {
    user_id: user.id,
    film_id: 2,
  },
  {
    user_id: user.id,
    film_id: 10,
  },
   {
    user_id: user.id,
    film_id: 1,
  },
   {
    user_id: user.id,
    film_id: 4,
  }
]
Favorite.create!(favorites_attributes)


ap Film.all


ap Favorite.all

