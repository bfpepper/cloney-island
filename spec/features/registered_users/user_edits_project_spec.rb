require "rails_helper"

describe "User can edit their project" do
  it "User is able to edit their project" do

    user = create(:user)
    project = create(:project)
    user_projects = create(:user_project, project: project, user: user)
    role = Role.create(name: "registered")
    user.roles << role

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    project = user.projects.first.title.parameterize

    visit user_path(user)

    click_on "Created Projects"
    click_on "Edit"

    expect(current_path).to eq(edit_project_path(project))
    fill_in "project[title]", with: "The New Hotness"

    click_on "Update"

    expect(current_path).to eq(project_path(Project.first.title.parameterize))
    expect(page).to have_content("The New Hotness")
  end

  it "User MUST have all info to edit their project" do

    user = create(:user)
    project = create(:project)
    user_projects = create(:user_project, project: project, user: user)
    role = Role.create(name: "registered")
    user.roles << role

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    project = user.projects.first.title.parameterize

    visit user_path(user)

    click_on "Created Projects"
    click_on "Edit"

    expect(current_path).to eq(edit_project_path(user.projects.first.title.parameterize))

    fill_in "project[description]", with: nil

    click_on "Update"

    expect(page).to have_content("Edit Project!")
  end
end
