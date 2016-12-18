require "rails_helper"

describe "A user can reset password" do
  it "User can reset password using Twillo 2FA" do

    code = rand(100000...999999)

    user = create(:user, phone: "+17203230072")

    visit login_path
    click_on "Forgot Password?"

    expect(current_path).to eq(confirm_id_path)

    save_and_open_page
    fill_in "password[email]", with: user.email
    click_on "Request confirmation code"
    expect(current_path).to eq(pass_reset_path)

    fill_in 'twilio_response_code', with: code
    fill_in "Password", with: "Turing1510"
    fill_in "Password_confirmation", with: "Turing1510"
    click_on "Update Password"

    expect(current_path).to eq(login_path)

    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: "Turing1510"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("#{user.name}")
  end
end
