class Event < ApplicationRecord
  has_many :guests
  has_many :users, through: :guests

  enum schedule: [ :matin, :apresmidi, :soir]
end
