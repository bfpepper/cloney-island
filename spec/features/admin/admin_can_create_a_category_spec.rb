require 'rails_helper'

describe 'An admin can create a category' do
  context 'authorized admin' do
    scenario 'they visit new_category_path' do
      admin = create(:user)
      role = Role.create(name: "admin")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      admin.roles << role

      visit new_admin_category_path

      fill_in "Name", with: "Art"
      click_button "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Art")
    end
  end
end
