require 'rails_helper'

describe "user show page" do
  context "as a signed in user" do
    scenario "I can see my show page" do
      user = create(:user)
      
      visit root_path
      click_on "Login"

      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password

      click_on "Sign In"

      click_on "Account"
      
      expect(page).to have_content(user.email)
      expect(page).to have_content(user.phone)
      expect(page).to have_content("Backed Projects")
      expect(page).to have_content("Current Projects")
      expect(page).to have_content("Edit Profile")
    end
  end
end
 
# as a signed in user
# when i visit root
# I click on user image
# I am directed to user show page
# I can can see my email and phone number
# i can see tabs to backed projects, current projects, edit profile