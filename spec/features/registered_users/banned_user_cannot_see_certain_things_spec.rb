require "rails_helper"

describe "Banned user viewing" do

  before(:each) do
    @user = create(:user_with_projects)
    @project = @user.projects.first
    @user.banned!
  end
  scenario "A banned user cannot create a project" do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit new_project_path
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

  end
  scenario "user cannot edit their existing project" do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit edit_project_path(@project)
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  scenario "user cannot back a project" do
    user = create(:user_with_projects)
    project = user.projects.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit projects_new_pledge_path(project.slug)
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end
end
