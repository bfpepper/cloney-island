require "rails_helper"

describe "A user can reset password" do
  it "User can reset password using Twillo 2FA", :vcr do
    code = rand(100000...999999)

    user = create(:user, phone: "+17203230072", verification_code: code)
    visit login_path
    click_on "Forgot Password?"

    expect(current_path).to eq(confirm_id_path)

    fill_in "password[email]", with: user.email
    click_on "Request confirmation code"


    user = User.find(user.id)
    new_code = user.verification_code

    expect(current_path).to eq(password_reset_path)

    fill_in 'password[twilio_response_code]', with: new_code
    fill_in "password[password]", with: "Turing1510"
    fill_in "password[password_confirmation]", with: "Turing1510"
    click_on "Update Password"

    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "Turing1510"

    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "Turing1510"

    click_on "Sign In"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("#{user.name}")
  end
end
