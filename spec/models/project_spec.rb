require 'rails_helper'

RSpec.describe Project, type: :model do
  context "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:description)}
    it { should validate_presence_of(:goal)}
  end
  context "Uniqueness" do
    it { should validate_uniqueness_of(:name)}
    it { should validate_uniqueness_of(:slug)}
  end
end
