require 'rails_helper'

describe 'As registered user' do
  context 'failing to fill in password on projects_new_pledge' do
    scenario 'I am back on the projects_new_pledge rather than project_path and I see error' do
      project = create(:project, title: "How to find a Job", goal: 100)
      user = create(:user)
      registered = Role.create(name: "registered")
      backer = Role.create(name: "backer")
      user.roles << registered
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project.slug)

      click_on "Back project!"
      fill_in :pledge_amount_given, with: "100"
      click_on "Back project!"

      expect(current_path).to eq(projects_new_pledge_path(project.slug))
      expect(page).to have_content("Must fill out all fields")
    end
  end
end
