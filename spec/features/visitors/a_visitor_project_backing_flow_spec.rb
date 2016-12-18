require 'rails_helper'

describe "guest visits project site" do
  context "guest tries to back a project" do
    scenario "I must sign up or login before I can back a project" do
      project = create(:project, title: "MooseWatch")

      visit project_path(project.slug)
      click_button "Back project!"
      
      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("or Sign Up")
      # expect(page).to have_content("You need to login or sign up to do that.")
    end
    
    scenario "I must login before I can back a project" do
      project = create(:project, title: "MooseWatch")
      user = create(:user)
      registered = Role.create(name: "registered")
      user.roles << registered
      backer = Role.create(name: "backer")
      
      visit project_path(project.slug)
      click_button "Back project!"
      
      expect(page).to have_content("or Sign Up")
      
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password

      click_on "Sign In"
      
      visit project_path(project.slug)
      click_button "Back project!"
      fill_in :pledge_amount_given, with: 50
      click_on "Back project!"

      expect(page).to have_button("Post Your Comment")
    end
  end
end







# -As a guest visiting a project site
# -I can click on "back project"
# -I am redirected to the login page which has a sublink to sign up if they don't have an account
# -I sign in
# -I am directed to the project backing page
# 
