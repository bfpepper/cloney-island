require 'rails_helper'

describe "As a user" do
 context "when I visit a projects show page" do
  scenario "I can back(give money) to a project" do
      project = create(:project, name: "How to find a Job", goal: 100)
      user = create(:user)
      role = Role.create(name: "registered")
      user.roles << role

      visit project_path(project)

      expect(find('div.progress-bar')['aria-valuenow']).to eq('0')

      click_on "Comments"

      within('div.tab-pane.active') do
        expect(page).to have_content("Only backers can post comments.")
      end

      click_on "Back Project"

      expect(current_path).to eq(projects_new_backer_path(project.slug))
      expect(page).to have_content("How to find a Job")

      fill_in :amount, with: 50
      click_on "Back Project"

      expect(current_path).to eq(project_path(project.slug))
      expect(find('div.progress-bar')['aria-valuenow']).to eq('10')

      click_on "comments"

      within('div.tab-pane.active') do
        expect(page).to have_button("Post Your Comment")
      end
    end
  end
end
