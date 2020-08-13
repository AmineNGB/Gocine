class Seance < ApplicationRecord
  belongs_to :cinema
  belongs_to :film
  has_many :events, dependent: :nullify

  validates :film, presence: true
  validates :cinema, presence: true
  validates :allocine_id, presence: true
end
