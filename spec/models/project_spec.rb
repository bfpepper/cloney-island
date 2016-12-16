require 'rails_helper'

RSpec.describe Project, type: :model do

  context "Uniqueness" do
    it { should validate_uniqueness_of(:name)}
    #it { should validate_uniqueness_of(:slug)}
  end

  context "validations" do
    #it { should validate_presence_of(:name)}
    #it { should validate_presence_of(:description)}
    #it { should validate_presence_of(:goal)}
    it "is valid with all attributes" do
      project = build(:project, slug: "slug")

      expect(project).to be_valid
    end

    xit "is invalid without a name" do
      project = build(:project, name: nil, slug: "slug")

      expect(project).to be_invalid
    end

    it "is invalid without a description" do
      project = build(:project, description: nil, slug: "slug")

      expect(project).to be_invalid
    end

    it "is invalid without a goal" do
      project = build(:project, goal: nil, slug: "slug")

      expect(project).to be_invalid
    end

    it "is invalid without a category_id" do
      project = build(:project, category: nil)

      expect(project).to be_invalid
    end
  end
end
