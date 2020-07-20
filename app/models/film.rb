class Film < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :seances
  has_many :cinemas, through: :seances
  has_many :events, through: :seances

  def new?
    self.date_release > Date.today - 7 if self.date_release
  end

  def top?
    if self.rate_viewer && self.rate_press
      ((self.rate_press + self.rate_viewer) / 2) > 4
    elsif self.rate_press
      self.rate_press > 4
    end
  end

  def self.now_on_theater
    films = []
    Film.order("date_release IS NULL, date_release DESC").each do |film|
      films << film if film.seances.count > 0
    end
    films
  end
end
