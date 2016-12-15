require "rails_helper"

describe "a registered user can log back in" do
  it "an existing user can log back into thier account" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password

    click_on "Sign In"

    expect(current_path).to eq(root_path)
  end

  it "a user MUST enter correct credentials or is re-shown the login page" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "this"

    click_on "Sign In"

    expect(current_path).to eq(login_path)
  end
end
