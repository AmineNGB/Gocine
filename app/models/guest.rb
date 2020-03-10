class Guest < ApplicationRecord
  belongs_to :user
  belongs_to :event
  # enum status: [ :pending, :confirmed, :rejected ]
  enum status: { pending: 0, confirmed: 1, rejected: 2 }
end
