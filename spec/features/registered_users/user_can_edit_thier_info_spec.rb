require "rails_helper"

describe "User edit info" do
  it "an existing user can edit their info" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_user_path(user)

    fill_in :Email, with: "Test@test.com"
    fill_in "user[email_confirmation]", with: "Test@test.com"

    click_on "Update"

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Test@test.com")
  end
end
