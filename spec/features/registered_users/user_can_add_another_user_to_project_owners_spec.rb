require "rails_helper"

describe "User adding user to project owner" do
  scenario "A project owner can add another user as project owner" do
    user1 = create(:user_with_projects)
    user2 = create(:user)
    project = user1.projects.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user1)

    visit project_path(project.slug)

    expect(page).to have_link("Add Someone Else As An Owner")

    click_on("Add Someone Else As An Owner")

    expect(current_path).to eq(edit_project_path(project.slug))

    fill_in "Person's Name", with: "#{user2.name}"

    click_on "That This Person"

    expect(current_path).to eq(project_path(project.slug))
    expect(page).to have_content("#{user2.name}")
  end
end
