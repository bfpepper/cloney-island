require "rails_helper"

describe "Visitor interaction with about page" do
  scenario "as a visitor I can view the about page" do

    visit root_path

    click_on "About Us"

    expect(current_path).to eq(about_path)
    expect(page).to have_content("Lee Saville")
    expect(page).to have_content("Ben Pepper")
    expect(page).to have_content("Noah Berman")
    expect(page).to have_content("Anthony Ciccone")
  end
end
