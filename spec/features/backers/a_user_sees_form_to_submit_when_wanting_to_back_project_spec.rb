require 'rails_helper'

describe 'As registered user' do
  context 'visiting a project page' do
    scenario "I click 'Back Project!' and see a form" do
      project = create(:project, title: "How to find a Job", goal: 100)
      user = create(:user)
      registered = Role.create(name: "registered")
      user.roles << registered
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project.slug)  

      click_on "Back project!"

      expect(current_path).to eq(projects_new_pledge_path(project.slug))
      expect(page).to have_content("How to find a Job")
      within('form') do
        expect(page).to have_field("pledge_amount_given")
        expect(page).to have_field("password")
      end
    end
  end
end
