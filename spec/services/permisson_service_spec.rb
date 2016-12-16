require 'rails_helper'


describe 'PermissionService' do
  context '#allow?' do
    xit "guest returns false for registered and admin" do
      user = build(:user)
      controller = ""

      guest = PermissionService.new()
    end
  end
end
