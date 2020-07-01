class Film < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :seances
  has_many :cinemas, through: :seances
  has_many :events, through: :seances
end


