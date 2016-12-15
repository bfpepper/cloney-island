require 'rails_helper'

describe "Creating an Account" do
  scenario "a visitor can create an account" do

    visit new_user_path

    fill_in 'user[name]', with: "Test Bob"
    fill_in "user[phone]", with: "303-555-5555"
    fill_in "user[email]", with: "test_email@example.com"
    fill_in "user[email_confirmation]", with: "test_email@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on 'Create Account'

    expect(page).to have_content("test_email@example.com")
    expect(page).to have_content("Welcome back Test Bob. What are you going to back today?")
  end
end
