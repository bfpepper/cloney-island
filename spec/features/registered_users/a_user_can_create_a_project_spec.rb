require 'rails_helper'


describe "User creates a project" do
  context "visit project create page" do
    scenario "a user fill in fields and clicks submit" do
      user = create(:user)
      role = Role.create(name: "registered")
      user.roles << role
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

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
      expect(user.projects.first.title).to eq(project.title)
    end
  end
end
