puts 'Cleaning database...'
Film.destroy_all
User.destroy_all

user = User.new
user.email = 'amine@gmail.com'
user.password = 'password'
user.save!

user2 = User.new
user2.email = 'nico@gmail.com'
user2.password = 'password'
user2.save!

puts 'Creating Films...'
films_attributes = [
  {
   photo_url: 'http://fr.web.img6.acsta.net/c_215_290/pictures/20/02/10/13/26/1423227.jpg',
   title: 'Invisible man',
   synopsis: 'Cecilia Kass est en couple avec un brillant et riche scientifique. Ne supportant plus son comportement violent et tyrannique, elle prend la fuite une nuit et se réfugie auprès de sa sœur, leur ami d\'enfance et sa fille adolescente. Mais quand l\'homme se suicide en laissant à Cecilia une part importante de son immense fortune, celle-ci commence à se demander s\'il est réellement mort',
   duration: '2 h 05 min',
   date_release: '26 février 2020',
   genre: 'Fantastique, Epouvante-horreur, Thriller',
   rate_press: 3.5,
   rate_viewer: 3.9
  },
  {
   photo_url: 'http://fr.web.img6.acsta.net/c_215_290/pictures/20/01/23/09/03/4377710.jpg',
   title: 'Mine de rien',
   synopsis: 'Dans une région qui fut le fleuron de l\'industrie minière, deux chômeurs de longue durée, ont l\'idée de construire un parc d\'attraction "artisanal" sur une ancienne mine de charbon désaffectée. En sauvant la mine et sa mémoire, ils vont retrouver force et dignité.',
   duration: '1 h 25 min',
   date_release: '26 février 2020',
   genre: 'Comédie',
   rate_press: 3.3,
   rate_viewer: 3.5
  },
  {
   photo_url: 'http://fr.web.img6.acsta.net/c_215_290/pictures/20/01/23/14/05/1683095.jpg',
   title: 'Dark Waters',
   synopsis: 'Robert Bilott est un avocat spécialisé dans la défense des industries chimiques. Interpellé par un paysan, voisin de sa grand-mère, il va découvrir que la campagne idyllique de son enfance est empoisonnée par une usine du puissant groupe chimique DuPont, premier employeur de la région.',
   duration: '2 h 08 min',
   date_release: '26 février 2020',
   genre: 'Biopic, Drame',
   rate_press: 3.9,
   rate_viewer: 4.1
  }
]

# ap "je suis la"

# planets_attributes.each do |planets_attribute|
#   ap "---------------------------------"
#   photo_file = planets_attribute.delete(:photo_file)
#   ap planets_attribute
#   planet = Planet.create!(planets_attribute)
#   ap photo_file
#   planet.photo.attach(io: File.open("photo_seed/#{photo_file}"), filename: 'toto.svg')
# end

# reservation_att = [
#   {
#     date: 20201001,
#     user: user,
#     planet: Planet.all.sample,
#   },
#   {
#     date: 20201018,
#     user: user,
#     planet: Planet.all.sample,
#   },
#   {
#     date: 20211201,
#     user: user2,
#     planet: Planet.all.sample,
#   },
#   {
#     date: 21211201,
#     user: user2,
#     planet: Planet.all.sample,
#   },
# ]

Film.create!(films_attributes)

puts 'Finished!'

Film.all.each do |el|
  p el.title
end
