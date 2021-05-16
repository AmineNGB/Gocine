require "rails_helper"

RSpec.describe Seance, type: :model do
  it { should belong_to(:cinema) }
  it { should belong_to(:film) }
  it { should have_many(:events).dependent(:nullify) }

  it { should validate_presence_of(:film) }
  it { should validate_presence_of(:cinema) }
  it { should validate_presence_of(:allocine_id) }
end
