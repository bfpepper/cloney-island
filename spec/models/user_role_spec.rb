require 'rails_helper'

RSpec.describe UserRole, type: :model do
  context "Relationships" do
    it "Belongs to user" do
      user_role = build(:user_role)

      expect(user_role).to respond_to(:user)
    end

    it "Belongs to role" do
      user_role = build(:user_role)

      expect(user_role).to respond_to(:role)
    end
  end
end
