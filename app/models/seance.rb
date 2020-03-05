class Seance < ApplicationRecord
  belongs_to :cinema
  belongs_to :film

  validates :film, presence: true
  validates :cinema, presence: true
end
