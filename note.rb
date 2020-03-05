cinema.get_movies
class Ciname < ApplicationRecord
  def create_movies
    AllocineMoviesService.new(allocine_id).call
  end
end
class AllocineMoviesService
  def initialize(id)
    @id = id
  end
  def call
    url = "allocine.com/#{id}"
    response = RestClient.post(url)
    movies = JSON.parse(response)
    movies.each do |movie|
      movie = Movie.find_or_initialize_by()
      Seance.create(cinema: , movie: )
    end
  end
end
