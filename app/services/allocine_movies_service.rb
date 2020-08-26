class AllocineMoviesService
  def initialize(allocine_id, id)
    @allocine_id = allocine_id
    @id = id
  end

  def call
    8.times do |i|
      ap i
      url_for_pages = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-#{i}/"
      response_for_pages = HTTParty.post(url_for_pages, headers = {})
      pages = JSON.parse(response_for_pages.body)["pagination"]["totalPages"]
      pages.times do |page|
        url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-#{i}/p-#{page + 1}/"
        ap url
        ap "---- Page #{page + 1}----"
        response = HTTParty.post(url, headers = {})
        movies = JSON.parse(response.body)["results"]
        movies.each do |hash|
          movie = hash["movie"]

          @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
            film.title = movie["title"]
            film.duration = movie["runtime"] if movie["runtime"]
            film.synopsis = movie["synopsis"] if movie["synopsis"]
            film.allocine_id = movie["internalId"] if movie["internalId"]
            film.photo_url = movie["poster"]["url"] if movie["poster"]["url"]
            film.date_release = movie["releases"][-1]["releaseDate"]["date"] if movie["releases"][-1]["releaseDate"]
            film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
            film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
            film.genre = movie["genres"].map { |n| n["translate"] }
            film.save
          end

          @film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
          @film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
          @film.save

          hash["showtimes"]["multiple"].each do |hash2|
            @link = hash2["data"]["ticketing"][0]["urls"][0] if hash2["data"]["ticketing"][0]
            attr = { horaire: hash2["startsAt"],
                     link: @link,
                     cinema_id: @id,
                     allocine_id: hash2["internalId"],
                     film_id: @film.id }
            Seance.find_or_create_by(link: attr[:link]) do
              Seance.create!(attr)
            end
          end

          # hash["showtimes"]["multiple"].each do |hash2|
          #   seance = Seance.new
          #   seance.horaire = hash2["startsAt"]
          #   seance.link = hash2["data"]["ticketing"][0]["urls"][0] if hash2["data"]["ticketing"][0]
          #   seance.cinema_id = @id
          #   seance.allocine_id = hash2["internalId"]
          #   seance.film_id = @film.id
          #   seance.save!
          # end
        end
        # if pages > 1
        #   url = "http://www.allocine.fr/_/showtimes/theater-#{@allocine_id}/d-#{i}/p-2/"
        #   response = HTTParty.post(url, headers = {})
        #   movies = JSON.parse(response.body)["results"]
        #   movies.each do |hash|
        #     movie = hash["movie"]

        #     @film = Film.find_or_create_by(allocine_id: movie["internalId"]) do |film|
        #       film.title = movie["title"]
        #       film.duration = movie["runtime"] if movie["runtime"]
        #       film.synopsis = movie["synopsis"] if movie["synopsis"]
        #       film.allocine_id = movie["internalId"] if movie["internalId"]
        #       film.photo_url = movie["poster"]["url"] if movie["poster"]["url"]
        #       film.date_release = movie["releases"][-1]["releaseDate"]["date"] if movie["releases"][-1]["releaseDate"]
        #       film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        #       film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        #       film.genre = movie["genres"].map { |n| n["translate"] }
        #       film.save
        #     end

        #     @film.rate_press = movie["stats"]["pressReview"]["score"] if movie["stats"]["pressReview"]
        #     @film.rate_viewer = movie["stats"]["userRating"]["score"] if movie["stats"]["userRating"]
        #     @film.save

        #     hash["showtimes"]["multiple"].each do |hash2|
        #       @link = hash2["data"]["ticketing"][0]["urls"][0] if hash2["data"]["ticketing"][0]
        #       attr = { horaire: hash2["startsAt"],
        #                link: @link,
        #                cinema_id: @id,
        #                allocine_id: hash2["internalId"],
        #                film_id: @film.id }
        #       Seance.find_or_create_by(link: attr[:link]) do
        #         Seance.create!(attr)
        #       end
        #     end
        #   end
        # end
      end
    end
  end
end
