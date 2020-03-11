class AllocineMoviesService

  def initialize(allocine_id, id)
    @allocine_id = allocine_id
    @id = id
  end

  def call
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-0/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        # seance.link = hash2["data"]["ticketing"][0]["urls"][0] if hash2["data"]["ticketing"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-1/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-2/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-3/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-4/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-5/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
    url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-6/"
    response = HTTParty.post(url, headers={})
    movies = JSON.parse(response.body)["results"]
    movies.each do |hash|
      movie = hash["movie"]

      @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        film.title = movie["title"]
        film.duration = movie["runtime"]
        film.synopsis = movie["synopsis"]
        film.allocine_id = movie["internalId"]
        film.photo_url = movie["poster"]["url"]
        film.date_release = movie["releases"][0]["releaseDate"]["date"] if movie["releases"][0]["releaseDate"]
        film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        film.genre = movie["genres"].map { |n| n["translate"] }
        film.save
      end

      hash["showtimes"]["multiple"].each do |hash2|
        seance = Seance.new
        seance.horaire = hash2["startsAt"]
        seance.cinema_id = @id
        seance.film_id = @film.id
        seance.save!
      end
    end
  end
end
