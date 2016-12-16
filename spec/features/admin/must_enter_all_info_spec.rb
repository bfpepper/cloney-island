require 'rails_helper'

describe 'An admin can create a category' do
  context 'authorized admin' do
    scenario 'they visit new_category_path' do
      # Need stub for admin authorization
      visit new_admin_category_path

      click_button "Create Category"

      expect(page).to have_content("Create a new Category")
    end

    scenario "Admin MUST enter all info to edit a category" do
      category = create(:category)

      visit admin_edit_category_path(category.slug)

      fill_in 'Name', with: nil

      click_on "Update"

      expect(page).to have_content("Edit")
    end
  end
end
