require 'rails_helper'

RSpec.describe Project, type: :model do

  context "Uniqueness" do
    it { should validate_uniqueness_of(:title)}
    it { should validate_uniqueness_of(:slug)}
  end

  context "validations" do
    it { should validate_presence_of(:title)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:goal)}
  end

  context "relationships" do
    it { should have_many(:pledges)}
    it { should have_many(:comments)}

    it { should have_many(:backers).through(:pledges)}
    it { should have_many(:commenters).through(:comments)}
  end

  context "#funding_received" do
    it 'returns current funding recieved' do
      project = create(:project, goal: 100)
      expect(project.funding_received).to eq(0)

      user = create(:user)
      pledge = create(:pledge, user: user, project: project, amount_given: 20)

      expect(project.funding_received).to eq(20)

      pledge = create(:pledge, user: user, project: project, amount_given: 20)

      expect(project.funding_received).to eq(40)
    end
  end
end
