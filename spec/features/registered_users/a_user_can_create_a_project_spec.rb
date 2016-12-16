require 'rails_helper'


describe "User created a project" do
  context "visit project create page" do
    scenario "a user fill in fields and clicks submit" do
      #need to add signed in user
      category = create(:category, name: 'Computer Science')
      project = build(:project)
      visit new_project_path

      fill_in "Title", with: project.title
      fill_in "Description", with: project.description
      fill_in "Goal", with: project.goal
      select('Computer Science', from: 'project_category_id')

      click_button "Create Project!"

      expect(current_path).to eq(project_path(project.title.parameterize))
      expect(page).to have_content('Computer Science')
      expect(page).to have_content(project.title)
      expect(page).to have_content(project.description)
      expect(page).to have_content(project.goal)
    end
  end
end
