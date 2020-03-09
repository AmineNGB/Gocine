class Event < ApplicationRecord
  has_many :guests
  has_many :users, through: :guests

  accepts_nested_attributes_for :guests

  enum schedule: [ :matin, :apresmidi, :soir]
end
