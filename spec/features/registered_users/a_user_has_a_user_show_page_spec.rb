require 'rails_helper'

describe "user show page" do
  context "as a signed in user" do
    scenario "I can see my show page" do
      user = create(:user)
      role = Role.create(name: "registered")
      user.roles << role

      visit root_path
      click_on "Login"

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password

      require "pry"; binding.pry
      click_link "Sign In"

      click_link "Account"

      expect(page).to have_content(user.email)
      expect(page).to have_content(user.phone)
      expect(page).to have_content("Backed Projects")
      expect(page).to have_content("Created Projects")
      expect(page).to have_content("Edit Profile")
    end
  end

  context "as a guest user" do
    scenario "I can't see a user's full show page" do
      user = create(:user)
      role = Role.create(name: "registered")
      user.roles << role

      visit user_path(user.id)

      expect(page).to have_content("The page you were looking for doesn't exist (404)")
    end
  end

end
