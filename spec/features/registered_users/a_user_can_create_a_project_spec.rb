require 'rails_helper'


describe "User created a project" do
  context "visit project create page" do
    scenario "a user fill in fields and clicks submit" do
      #need to add signed in user
      project = build(:project)
      category = create(:category, name: "Art")
      visit new_project_path

      fill_in "Name", with: project.name
      fill_in "Description", with: project.description
      fill_in "Goal", with: project.goal
      select "Art", from: "categories"

      click_button "Create Project!"

      expect(current_path).to eq(project_path(project.name.parameterize))
      expect(page).to have_content(project.name)
      expect(page).to have_content(project.description)
      expect(page).to have_content(project.goal)
    end
  end
end
