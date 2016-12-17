require "rails_helper"

describe "A user can reset password" do
  it "User can reset password using Twillo 2FA" do

    user = create(:user, password: "7203230072")

    visit login_path
    click_on "Forgot Password?"

    expect(current_path).to eq(pass_reset_path)

    fill_in "Phone", with: "7203230072"
    click_on "Reset Password"

    expect(current_path).to eq(twillo_path)

    fill_in "NUMBER", with: '<Twillo number>'
    fill_in "Passowrd", with: "Turing1510"
    fill_in "Passowrd_confirmation", with: "Turing1510"
    click_on "Update Password"

    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "Turing1510"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{user.name}")
  end
end
