require 'open-uri'
"Cleaning DataBase"
Film.destroy_all
"Creation des films à l\'affiche"

films = []

html_file_path = open("http://www.allocine.fr/film/aucinema/").path
doc = Nokogiri::HTML(File.open(html_file_path))
doc.search('.card.entity-card.entity-card-list.cf').take(5).each do |link|
  title = link.search('.meta .meta-title .meta-title-link').text.strip
  photo_url = link.search('.thumbnail-img').attr('data-src')
  synopsis = link.search('.content-txt').text.strip
  duration = link.search('.meta-body-item .meta-body-info').text.strip
  date_release = link.search('.meta-body-item .date').text.strip
  genre = link.search('.meta-body-item .meta-body-info .xXx').text.strip
  rate_press = link.search('.stareval-note').text.strip
  rate_viewer = link.search('.stareval-note').text.strip
  allocine_id = link.search('.meta-title-link .href').text.strip
    films << { title: title, photo_url: photo_url, synopsis: synopsis, duration: duration, date_release: date_release, genre: genre, rate_press: rate_press, rate_viewer: rate_viewer, allocine_id: allocine_id }
end

ap films

# films.each do |film|
#   Film.create!(film)
# end

# ap Film.all
