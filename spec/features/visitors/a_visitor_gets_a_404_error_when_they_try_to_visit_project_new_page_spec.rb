require 'rails_helper'

describe 'As a guest' do
  context 'When I type in project/new in url bar' do
    scenario 'page does not exist' do
      visit new_project_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end

  context 'When a visitor clicks on Start a Project!' do
    scenario 'page does not exist' do

      visit root_path
      
      click_link "Start a Project"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("You need to login or create an account to do that.")
    end
  end
end
