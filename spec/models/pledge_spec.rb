require 'rails_helper'

RSpec.describe Pledge, type: :model do
  context "Relationships" do
    it 'belongs to a user' do
      pledge = build(:pledge)

      expect(pledge).to respond_to(:user)
    end

    it 'belongs to a project' do
      pledge = build(:pledge)

      expect(pledge).to respond_to(:project)
    end
  end

  context 'validations' do
    it 'needs an amount' do
      pledge = build(:pledge, amount_given: nil)

      expect(pledge).to_not be_valid
    end

    it 'needs a user' do
      pledge = build(:pledge, user: nil)

      expect(pledge).to_not be_valid
    end

    it 'needs a project' do
      pledge = build(:pledge, project: nil)

      expect(pledge).to_not be_valid
    end
  end
end
