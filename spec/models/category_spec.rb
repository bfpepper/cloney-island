require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    it 'is valid with name' do
      category = build(:category)

      expect(category).to be_valid
    end

    it 'is invalid without a name' do
      category = build(:category)

      expect(category).to be_valid
    end

    it 'validate uniqueness' do
      create(:category, name: "Frank")
      category = build(:category, name: "Frank")

      expect(category).to be_invalid
    end
  end

  context "Relationships" do
    it 'has many projects' do
      category = build(:category)

      expect(category).to respond_to(:projects)
    end
  end
end
