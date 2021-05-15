require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:favorites) }
  it { should have_many(:films) }
  it { should have_many(:guests) }
  it { should have_many(:events) }
  it { should have_many(:friendships) }
  it { should have_many(:frienders) }
  it { should have_many(:friendeds) }
  it { should have_many(:requesters) }
  it { should have_many(:requester_users) }
  it { should have_many(:requesteds) }
  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }

  describe "to_s" do
    context "when user has nom and prenom"  do
      it "return a string with prenom nom" do
        user = create(:user, nom: "ngb", prenom: "amine")

        expect(user.to_s).to  eq("amine ngb")
      end
    end
    context "when user doesn't fill nom and prenom" do
      it "return a string with prenom nom" do
        user = create(:user, nom: nil, prenom: nil, email: "nil@example.com")

        expect(user.to_s).to  eq("nil@example.com")
      end
    end
  end
  
end
