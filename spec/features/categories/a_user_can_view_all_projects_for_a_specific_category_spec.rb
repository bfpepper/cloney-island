require 'rails_helper'


describe 'As a user' do
  context 'when I visit a category' do
    scenario 'I can see all associated projects' do
      category = create(:category, name: 'Computer Science')
      project1, project2  = create_list(:project, 2, category_id: category.id)

      visit categories_path

      click_link 'Computer Science'

      expect(current_path).to eq(category_path(category.name.parameterize))
      expect(page).to have_content('Computer Science')
      expect(page).to have_content(project1.name)
    end
   end
 end
