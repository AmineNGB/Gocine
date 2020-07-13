class Film < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites
  has_many :seances
  has_many :cinemas, through: :seances
  has_many :events, through: :seances

  def new?
    self.date_release > Date.today - 7 if self.date_release
  end
end
