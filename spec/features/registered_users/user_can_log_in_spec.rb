require "rails_helper"

describe "a registered user can log back in" do
  it "an existing user can log back into thier account" do
    user = create(:user)

    visit root_path

    click_on "Login"

    fill_in :email, with: user.email
    fill_in :password, with: user.password

    click_on "Sign In"

    expect(current_page).to eq(root_path)
  end
end

# when a registered user visits root
# clicks on login
# enters form credentials
# clicks sign in
# redirected to root
