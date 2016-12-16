require 'rails_helper'


describe 'PermissionService' do
  context '#allow?' do
    it "guest returns false for admin" do
      user = create(:user)
      user.roles << Role.create(name: "registered")
      controller = "admin/categories"
      action = "new"

      guest = PermissionsService.new(user, controller, action).allow?

      expect(guest).to eq(false)
    end
  end
end
