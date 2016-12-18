require "rails_helper"

describe User, type: :model do
  context "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:phone)}
    it { should validate_presence_of(:password)}
    it { should validate_confirmation_of(:password)}
  end

  context "Uniquness" do
    it { should validate_uniqueness_of(:phone)}
    it { should validate_uniqueness_of(:email)}
  end

  context "Relationships" do
    it { should have_many(:user_projects)}
    it { should have_many(:projects).through(:user_projects)}
    it { should have_many(:user_roles)}
    it { should have_many(:roles).through(:user_roles)}
    it 'has many backed projects' do
      user = build(:user)

      expect(user).to respond_to(:backed_projects)
    end
  end
end
