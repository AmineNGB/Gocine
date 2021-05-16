require "rails_helper"

RSpec.describe Cinema, type: :model do
  it { should have_many(:seances) }
  it { should have_many(:films) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:ville) }
  it { should validate_presence_of(:allocine_id) }
  it { should validate_uniqueness_of(:allocine_id).ignoring_case_sensitivity }
end
