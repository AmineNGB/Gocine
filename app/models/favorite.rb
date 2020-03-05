class Favorite < ApplicationRecord
  belongs_to :user
  acts_as_list scope: :user
  belongs_to :film

  validates :film, presence: true
  validates :user, presence: true
end
