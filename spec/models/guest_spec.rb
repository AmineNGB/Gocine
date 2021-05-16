require "rails_helper"

RSpec.describe Guest, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:event) }
  it { should define_enum_for(:status).with_values([:pending, :confirmed, :rejected]) }
end
