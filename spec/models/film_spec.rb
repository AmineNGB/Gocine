require "rails_helper"

RSpec.describe Film, type: :model do
  it { should have_many(:favorites) }
  it { should have_many(:users).through(:favorites) }
  it { should have_many(:seances) }
  it { should have_many(:cinemas).through(:seances) }
  it { should have_many(:events).through(:seances) }
end
