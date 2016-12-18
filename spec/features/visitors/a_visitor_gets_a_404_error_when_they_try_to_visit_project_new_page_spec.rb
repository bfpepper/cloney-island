require 'rails_helper'

describe 'As a guest' do
  context 'When I type in project/new in url bar' do
    scenario 'page does not exist' do
      visit new_project_path

      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end

  context 'When a visitor clicks on Start a Project!'
    scenario 'page does not exist' do
    end
  end 
end
