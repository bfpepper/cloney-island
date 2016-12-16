require 'rails_helper'

describe 'As a guest' do
  context 'When I try to visit new_project_path' do
    scenario 'page does not exist' do
      visit new_project_path
      save_and_open_page

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
