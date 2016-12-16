require "rails_helper"

describe "User MUST enter all info" do
  it "A user MUST enter all required info for the project to be created" do
    user = create(:user)
    role = Role.create(name: "registered")
    user.roles << role
    project = build(:project)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_project_path

    fill_in "Name", with: project.name
    fill_in "Description", with: project.description
    click_button "Create Project!"

    expect(current_path).to eq(new_project_path)
  end
end
