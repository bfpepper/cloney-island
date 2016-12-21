require 'rails_helper'

describe 'As a user' do
  context 'When I visit categories_path' do
    scenario 'I see all categories' do
      categories = create_list(:category, 5)
      first = categories.first
      last = categories.last

      visit categories_path

      expect(page).to have_content("Categories")
      expect(page).to have_button(first.name)
      expect(page).to have_button(last.name)
    end
  end
end
