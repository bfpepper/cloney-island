require "rails_helper"

describe "User can edit their project" do
  it "User is able to edit their project" do

    user = create(:user_with_projects)
    role = Role.create(name: "registered")
    user.roles << role
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    project = user.projects.first.title.parameterize

    visit project_path(project)

    click_on "Edit Your Project"

    expect(current_path).to eq(edit_project_path(project))
    fill_in "project[title]", with: "The New Hotness"

    click_on "Update"

    expect(current_path).to eq(project_path(Project.first.title.parameterize))
    expect(page).to have_content("The New Hotness")
  end

  it "User MUST have all info to edit their project" do

    user = create(:user_with_projects)
    role = Role.create(name: "registered")
    user.roles << role
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit project_path(user.projects.first.title.parameterize)

    click_on "Edit Your Project"

    expect(current_pathg).to eq(edit_project_path(user.projects.first.title.parameterize))

    fill_in "project[description]", with: nil

    click_on "Update"

    expect(page).to have_content("Edit Your Project")
  end
end
