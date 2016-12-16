require 'rails_helper'

describe 'An admin can create a category' do
  context 'authorized admin' do
    scenario 'they visit new_category_path' do

      admin = create(:user)
      role = Role.create(name: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      admin.roles << role

      visit new_admin_category_path

      click_button "Create Category"

      expect(page).to have_content("Create a new Category")
    end

    scenario "Admin MUST enter all info to edit a category" do
      
      admin = create(:user)
      role = Role.create(name: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      admin.roles << role

      category = create(:category)

      visit admin_edit_category_path(category.slug)

      fill_in 'Name', with: nil

      click_on "Update"

      expect(page).to have_content("Edit")
    end
  end
end
