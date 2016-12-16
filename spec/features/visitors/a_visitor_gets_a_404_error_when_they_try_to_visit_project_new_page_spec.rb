require 'rails_helper'

describe 'As a guest' do
  context 'When I try to visit new_project_path' do
    scenario 'I see a 404' do
      visit new_project_path

      expect(status_code).to eq(404)
      expect(page).to have_content("Not found")
    end
  end
end
