require "rails_helper"

describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:phone)}
    it { should validate_presence_of(:password)}
  end
  
  context "Uniquness" do
    it { should validate_uniqueness_of(:phone)}
    it { should validate_uniqueness_of(:email)}
  end

  context "Relationships" do
    it "has many roles" do
      user = build(:user)

      expect(user).to respond_to(:roles)
    end
  end
end
