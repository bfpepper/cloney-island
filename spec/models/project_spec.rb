require 'rails_helper'

RSpec.describe Project, type: :model do
  context "validations" do
    it "is valid with all attributes" do
      project = build(:project)

      expect(project).to be_valid
    end

    xit "is invalid without a name" do
      project = build(:project, name: nil)

      expect(project).to be_invalid
    end

    it "is invalid without a description" do
      project = build(:project, description: nil)

      expect(project).to be_invalid
    end

    it "is invalid without a goal" do
      project = build(:project, goal: nil)

      expect(project).to be_invalid
    end
  end
end
