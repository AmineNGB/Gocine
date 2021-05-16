class AllocineMoviesService
  def initialize(allocine_id, id)
    @allocine_id = allocine_id
    @cinema_id = id
  end

  def call
    8.times do |day|
      number_of_pages_for(day).times do |page|
        movies_for(page, day).each do |movie_info|
          movie = movie_info["movie"]

          film = find_or_create_film(movie)

          find_or_create_seance(film, movie_info)
        end
      end
    end
  end

  private

  attr_reader :allocine_id, :cinema_id

  def number_of_pages_for(day)
    url_for_pages = "http://www.allocine.fr/_/showtimes/theater-#{allocine_id}/d-#{day}/"
    response_for_pages = HTTParty.post(url_for_pages, headers = {})
    JSON.parse(response_for_pages.body)["pagination"]["totalPages"]
  end

  def movies_for(page, day)
    url = "http://www.allocine.fr/_/showtimes/theater-#{allocine_id}/d-#{day}/p-#{page + 1}/"
    response = HTTParty.post(url, headers = {})
    movies = JSON.parse(response.body)["results"]
  end

  def find_or_create_film(movie)
    film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
      film.title = movie.dig("title")
      film.duration = movie.dig("runtime")
      film.synopsis = movie.dig("synopsis")
      film.allocine_id = movie.dig("internalId")
      film.photo_url = movie.dig("poster", "url")
      film.date_release = movie.dig("releases", -1, "releaseDate", "date")
      film.rate_press = movie.dig("stats", "pressReview", "score")
      film.rate_viewer = movie.dig("stats", "userRating", "score")
      film.genre = movie["genres"].map { |n| n["translate"] }
    end
  end

  def find_or_create_seance(film, movie_info)
    movie_info["showtimes"]["multiple"].each do |seance|
      link = seance["data"]["ticketing"][0]["urls"][0] if seance["data"]["ticketing"][0]
      attr = { horaire: seance["startsAt"],
               link: link,
               cinema_id: cinema_id,
               allocine_id: seance["internalId"],
               film_id: film.id }
      Seance.find_or_create_by(link: attr[:link]) do
        Seance.create!(attr)
      end
    end
  end
end
