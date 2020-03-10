class Event < ApplicationRecord
  has_many :guests
  has_many :users, through: :guests
  belongs_to :seance, optional: true
  has_one :film, through: :seance
  accepts_nested_attributes_for :guests

  enum schedule: [ :matin, :apresmidi, :soir]
end
