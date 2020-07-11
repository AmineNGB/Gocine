class MovieMatcher
  def initialize(event)
    @event = event
    @score = Hash.new(0)
  end

  def find_best_seance
    calculate_scores
    # ap "Je suis la"
    # ap @event.good_movies.where(film_id: best_score[0])
    # ap "Et puis la"
    # ap best_score
    if best_score.nil?
      return 0
    end
    @event.good_movies.where(film_id: best_score[0]).first
  end

  def best_score
    @score.max_by { |k, v| v }
  end

  attr_reader :event

  def calculate_scores
    guests = @event.guests.confirmed
    users = []
    guests.each do |guest|
      users << guest.user
    end
    # ap "Event calcul"
    # ap @event
    users.each do |user|
      movies = user.favorites.where(film_id: event.good_movies.pluck(:film_id))
      movies.each_with_index do |movie, i|
        note = 6 - i
        @score[movie.film_id] += note
      end
    end
  end
end
