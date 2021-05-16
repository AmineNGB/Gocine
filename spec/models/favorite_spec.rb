require "rails_helper"

RSpec.describe Favorite, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:film) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:film) }
end
