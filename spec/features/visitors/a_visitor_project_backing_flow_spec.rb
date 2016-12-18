require 'rails_helper'

describe "guest visits project site" do
  context "guest tries to back a project" do
    scenario "I must sign up before I can back a project" do
      project = create(:project, title: "MooseWatch")

      visit project_path(project.slug)
      click_button "Back project!"
      
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("or Sign Up")
    end
  end
end







# -As a guest visiting a project site
# -I can click on "back project"
# -I am redirected to the login page which has a sublink to sign up if they don't have an account
# -I sign in
# -I am directed to the project backing page
# 
