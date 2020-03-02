class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :film

  validates :film, presence: true
  validates :user, presence: true
end
