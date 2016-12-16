require 'rails_helper'


describe 'PermissionService' do
  context '#allow?' do
    it "registered user returns nil for admin" do
      user = create(:user)
      user.roles << Role.create(name: "registered")
      controller = "admin/categories"
      action = "new"

      permission = PermissionsService.new(user, controller, action)

      guest = permission.allow?

      expect(guest).to eq(nil)
    end

    it "guest returns false for admin" do
      user = create(:user)
      controller = "admin/categories"
      action = "new"

      permission = PermissionsService.new(user, controller, action)

      guest = permission.allow?

      expect(guest).to eq(nil)
    end

    it "guest returns false for registered" do
      user = create(:user)
      controller = "projects"
      action = "new"

      permission = PermissionsService.new(user, controller, action)

      guest = permission.allow?

      expect(guest).to eq(nil)
    end
  end
end
