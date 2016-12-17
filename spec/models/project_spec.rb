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
    it 'has many backers' do
      project = create(:project)

      expect(project).to respond_to(:backers)
    end
  end

  context "#funding_received" do
    it 'returns current funding recieved' do
      project = create(:project, goal: 100)
      expect(project.funding_received).to eq(0)

      user = create(:user)
      backer = create(:backer, user: user, project: project, amount_give: 20)

      expect(project.funding_received).to eq(20)
    end
  end
end
