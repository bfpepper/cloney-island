require "rails_helper"

describe "a registered user can log back in" do
  it "an existing user can log back into thier account" do
    user = create(:user)

    # when a registered user visits root
    visit root_path

    # clicks on login
    click_on "Login"

    # enters form credentials
    fill_in :email, with: user.email
    fill_in :password, with: user.password

    # clicks sign in
    click_on "Sign In"

    # redirected to root
    expect(current_page).to eq(root_path)
  end
end
