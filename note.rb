# cinema.get_movies
# class Ciname < ApplicationRecord
#   def create_movies
#     AllocineMoviesService.new(allocine_id).call
#   end
# end
# class AllocineMoviesService
#   def initialize(id)
#     @id = id
#   end
#   def call
#     url = "allocine.com/#{id}"
#     response = RestClient.post(url)
#     movies = JSON.parse(response)
#     movies.each do |movie|
#       movie = Movie.find_or_initialize_by()
#       Seance.create(cinema: , movie: )
#     end
#   end
# end




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
