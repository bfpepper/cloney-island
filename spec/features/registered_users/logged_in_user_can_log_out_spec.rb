require "rails_helper"

describe "Logged in user can log out" do
  it "a logged in user can log out" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_on "Sign In"

    click_on "Sign Out"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Login")
  end
end
