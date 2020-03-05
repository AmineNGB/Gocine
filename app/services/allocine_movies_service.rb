class AllocineMoviesService
  def initialize(allocine_id)
    @allocine_id = allocine_id
  end
  def call
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-0/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end


      # movie_attr = {
      # title: movie["title"],
      # duration: movie["runtime"],
      # synopsis: movie["synopsis"],
      # allocine_id: movie["internalId"],
      # photo_url: movie["poster"]["url"],
      # date_release: movie["releases"][0]["releaseDate"]["date"],
      # rate_viewer: movie["stats"]["userRating"]["score"],
      # # rate_press: movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"],
      # genre: movie["genres"].each { |n| "#{n["translate"]},"}
      # }

      # movie = hash["movie"]
      # ap movie["title"]
      # ap movie["runtime"]
      # ap movie["synopsis"]
      # ap movie["internalId"]
      # ap movie["poster"]["url"]
      # ap movie["releases"][0]["releaseDate"]["date"]
      # ap movie["stats"]["userRating"]["score"]
      # ap movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
      # movie["genres"].each { |n| ap "#{n["translate"]},"}

      # ap "--------------------------------------------"
      # movie = Movie.find_or_create_by(allocine_id: )
      # Seance.create(cinema: , movie: )
    end
  end
end
