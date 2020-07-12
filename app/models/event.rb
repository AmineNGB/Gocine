class Event < ApplicationRecord
  has_many :guests
  has_many :users, through: :guests
  belongs_to :seance, optional: true
  has_one :film, through: :seance
  accepts_nested_attributes_for :guests

  # enum schedule: [:matin, :apresmidi, :soir]

  validates :date, presence: true
  validates :schedule, presence: true
  validates :endschedule, presence: true
  validates :cinema_id, presence: true
  validate :schedule_must_be_lower_than_endschedule
  validate :event_cant_be_in_past
  validate :event_cant_be_in_more_than_7_days

  def event_cant_be_in_more_than_7_days
    if date > Date.today + 7
      errors.add(:date, "Vous ne pouvez pas créer un évenement dans plus d'une semaine")
    end
  end

  def event_cant_be_in_past
    if date < Date.today
      errors.add(:date, "Vous ne pouvez pas créer d'évenement dans le passé")
    end
  end

  def schedule_must_be_lower_than_endschedule
    if schedule > endschedule
      errors.add(:schedule, "L'heure du début doit être avant la fin ..")
    end
  end

  def good_movies
    Seance.where(horaire: hours_range, cinema_id: cinema_id)
  end

  def hours_range
    # if matin?
    #   date.to_datetime.change(hour: 10)..date.to_datetime.change(hour: 13)
    # elsif apresmidi?
    #   date.to_datetime.change(hour: 13)..date.to_datetime.change(hour: 18)
    # elsif soir?
    #   date.to_datetime.change(hour: 18)..date.to_datetime.change(hour: 23)
    # end
    date.to_datetime.change(hour: self.schedule)..date.to_datetime.change(hour: self.endschedule)
  end

  def date_fr
    date.strftime("%A %d %B")
  end

  def cinema
    Cinema.find(cinema_id)
  end

  def creator
    self.guests.last.user
  end

  def participants
    guests = self.guests.reject { |guest| guest.status != "confirmed" }
  end
end
