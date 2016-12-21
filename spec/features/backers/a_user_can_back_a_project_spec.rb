require 'rails_helper'

describe "As a user" do
 context "when I visit a projects show page" do
  scenario "I can back(give money) to a project" do
      user = create(:user_with_projects)
      project = user.projects.first
      registered = Role.create(name: "registered")
      backer = Role.create(name: "backer")
      user.roles << registered
      
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project.slug)

      expect(find('div.progress-bar')['aria-valuenow']).to eq('0')
      expect(page).to have_content("Only backers of #{project.title} can post comments.")

      click_on "Back project!"

      expect(current_path).to eq(projects_new_pledge_path(project.slug))
      expect(page).to have_content(project.title)

      fill_in :pledge_amount_given, with: 50
      fill_in :password, with: user.password
      click_on "Back project!"

      expect(current_path).to eq(project_path(project.slug))
      expect(find('div.progress-bar')['aria-valuenow'].to_i).to be >= 50

      expect(page).to have_button("Post Your Comment")
    end
  end
end
