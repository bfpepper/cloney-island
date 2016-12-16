require 'rails_helper'

describe 'Admin edits category' do
  context 'category already exists' do
    scenario 'click edit, enter new info, sumbit' do
      category = create(:category, name: 'Computer Science')

      admin = create(:user)
      role = Role.create(name: "admin")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      admin.roles << role


      visit admin_categories_path

      click_button 'Edit'
      expect(current_path).to eq(admin_edit_category_path(category.slug))

      fill_in 'Name', with: 'Knitting'
      click_button 'Update'

      expect(current_path).to eq(admin_categories_path)
      expect(page).to have_content('Knitting')
    end
  end
end
