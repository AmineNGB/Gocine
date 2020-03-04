require 'open-uri'
require 'nokogiri'
require 'awesome_print'
"Cleaning DataBase"
# Film.destroy_all
"Creation des films à l\'affiche"

films = []

# html_file_path = open("http://www.allocine.fr/film/aucinema/").path
# doc = Nokogiri::HTML(File.open(html_file_path))
doc = Nokogiri::HTML(File.open('file.html').read)
doc.search('.card.entity-card.entity-card-list.cf').take(15).each do |link|
  title = link.search('.meta .meta-title .meta-title-link').text.strip
  thumbnail_element = link.search('.thumbnail-img')
  photo_url = (thumbnail_element.attr('data-src') || thumbnail_element.attr('src')).value
  synopsis = link.search('.content-txt').text.strip
  date_release = link.search('.meta-body-item .date').text.strip
  duration_el = link.search('.meta-body-item.meta-body-info').text.strip
  toto = duration_el.split("\n").map { |item| item.strip }.reject{ |item| item.empty? }
  date = toto[0]
  duration = toto[2]
  genre = toto[4..-1].join(" ")
  rating_ele = link.search('.rating-item-content .stareval-note').text.gsub(",", ".")
  rate_press = rating_ele[0..2].to_f
  rate_viewer = rating_ele[3..5].to_f
  allocine_id = link.search('.meta-title-link').attr("href").text.strip
  films << { title: title, photo_url: photo_url, synopsis: synopsis, duration: duration, date_release: date_release, genre: genre, rate_press: rate_press, rate_viewer: rate_viewer, allocine_id: allocine_id }
end

films.each do |movie|
 Film.create!(movie)
end


ap Film.all
