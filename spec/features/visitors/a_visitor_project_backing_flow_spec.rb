require 'rails_helper'

describe "guest visits project site" do
  context "guest tries to back a project" do
    scenario "I must sign up or login before I can back a project" do
      user = create(:user_with_projects)
      project = user.projects.first

      visit project_path(project.slug)
      click_button "Back project!"

      expect(page).to have_content("Email")
      expect(page).to have_content("Password")
      expect(page).to have_content("or create an account!")
      expect(page).to have_content("You need to login or create an account to do that.")
    end

    scenario "I must login before I can back a project" do
      user = create(:user_with_projects)
      project = user.projects.first
      registered = Role.create(name: "registered")
      user.roles << registered
      backer = Role.create(name: "backer")

      visit project_path(project.slug)
      click_button "Back project!"

      expect(page).to have_content("or create an account!")

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password

      click_on "Sign In"

      visit project_path(project.slug)
      click_button "Back project!"

      fill_in :pledge_amount_given, with: 50
      fill_in :password, with: user.password
      click_on "Back project!"
      expect(page).to have_button("Post Your Comment")
    end

    scenario "I must sign up before I can back a project" do
      user = create(:user_with_projects)
      project = user.projects.first
      registered = Role.create(name: "registered")
      backer = Role.create(name: "backer")

      visit project_path(project.slug)
      click_button "Back project!"

      expect(page).to have_content("or create an account!")

      click_on "create an account"

      fill_in 'user[name]', with: "Test Bob 1"
      fill_in "user[phone]", with: "555-555-5555"
      fill_in "user[email]", with: "ohno@example.com"
      fill_in "user[email_confirmation]", with: "ohno@example.com"
      fill_in "user[password]", with: "hunter42"
      fill_in "user[password_confirmation]", with: "hunter42"

      click_on 'Create Account'

      visit project_path(project.slug)
      click_button "Back project!"
      fill_in :pledge_amount_given, with: 50
      fill_in :password, with: "hunter42"
      click_on "Back project!"

      expect(page).to have_button("Post Your Comment")
    end
  end
end