require 'rails_helper'

describe "As a user" do
 context "when I visit a projects show page" do
  scenario "I can back(give money) to a project" do
      project = create(:project, title: "How to find a Job", goal: 100)
      user = create(:user)
      role = Role.create(name: "registered")
      user.roles << role
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project.slug)

      expect(find('div.progress-bar')['aria-valuenow']).to eq('0')
      expect(page).to have_content('Only backers of How to find a Job can post comments.')

      click_on "Back project!"

      expect(current_path).to eq(projects_new_pledge_path(project.slug))
      expect(page).to have_content("How to find a Job")

      fill_in :amount, with: 50
      click_on "Back project!"

      expect(current_path).to eq(project_path(project.slug))
      expect(find('div.progress-bar')['aria-valuenow']).to eq('10')

      click_on "comments"

      within('div.tab-pane.active') do
        expect(page).to have_button("Post Your Comment")
      end
    end
  end
end
