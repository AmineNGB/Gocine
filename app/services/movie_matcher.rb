class MovieMatcher
  def initialize(event)
    @event = event
    @score = Hash.new(0)
  end

  def find_best_seance
    calculate_scores
    ap "Je suis la"
    ap @event.good_movies.where(film_id: best_score[0])
    ap "Et puis la"
    ap best_score
    @event.good_movies.where(film_id: best_score[0]).first
  end

  def best_score
    @score.max_by { |k,v| v }
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
      # binding.pry
      movies.each_with_index do |movie, i|
        note = 6 - i
        # ap "Note"
        # ap note
        # ap "Movie"
        # ap movie
        # ap "Score"
        @score[movie.film_id] += note
        # ap @score
      end
    end
  end
end
