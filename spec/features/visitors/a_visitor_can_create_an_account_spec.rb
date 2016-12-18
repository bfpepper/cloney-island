require 'rails_helper'

describe "Creating an Account" do
  scenario "a visitor can create an account" do
    Role.create(name: 'registered')

    visit new_user_path

    fill_in 'user[name]', with: "test"
    fill_in "user[phone]", with: "303-555-5555"
    fill_in "user[email]", with: "test_email@example.com"
    fill_in "user[email_confirmation]", with: "test_email@example.com"
    fill_in "user[password]", with: "123"
    fill_in "user[password_confirmation]", with: "123"

    click_on "Create Account"
    save_and_open_page
    expect(page).to have_content("test_email@example.com")
  end

  scenario "a visitor can create an account" do

    visit new_user_path

    fill_in 'user[name]', with: "Test Bob"
    fill_in "user[email]", with: "test_email@example.com"
    fill_in "user[email_confirmation]", with: "test_email@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)
  end
end
