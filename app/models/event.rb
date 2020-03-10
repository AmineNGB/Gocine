class Event < ApplicationRecord
  has_many :guests
  has_many :users, through: :guests
  belongs_to :seance, optional: true
  has_one :film, through: :seance
  accepts_nested_attributes_for :guests

  enum schedule: [ :matin, :apresmidi, :soir]

  def good_movies
    Seance.where(horaire: hours_range, cinema_id: cinema_id)
  end

  # def good_movies_id
  #   good_movies.pluck(:id)
  # end

  def hours_range
    if matin?
      date.to_datetime.change(hour: 10)..date.to_datetime.change(hour: 13)
    elsif apresmidi?
      date.to_datetime.change(hour: 13)..date.to_datetime.change(hour: 18)
    elsif soir?
      date.to_datetime.change(hour: 18)..date.to_datetime.change(hour: 23)
    end
  end
end
