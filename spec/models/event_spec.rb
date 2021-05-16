require "rails_helper"

RSpec.describe Event, type: :model do
  it { should have_many(:guests) }
  it { should have_many(:users) }
  it { should have_one(:film) }
  it { should belong_to(:cinema) }
  it { should belong_to(:seance).optional }
  it { should accept_nested_attributes_for(:guests) }

  it { should validate_presence_of(:date) }
  it { should validate_presence_of(:schedule) }
  it { should validate_presence_of(:endschedule) }
  it { should validate_presence_of(:cinema_id) }
end
