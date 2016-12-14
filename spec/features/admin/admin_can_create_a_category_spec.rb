require 'rails_helper'

describe 'An admin can create a category' do
  context 'authorized admin' do
    scenario 'they visit new_category_path' do
      # Need stub for admin authorization
      visit admin_new_category_path

      fill_in "Name", with: "Art"
      click_button "Create Category"

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content("Art")
      expect(page).to have_button("Edit")
      expect(page).to have_button("Delete")
      expect(page).to have_button("New Category")
    end
  end
end
