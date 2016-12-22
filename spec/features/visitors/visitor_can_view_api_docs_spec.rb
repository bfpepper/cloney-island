require "rails_helper"

describe "As a visitor" do
  context "when I visit the api page" do
    scenario "I see the api docs" do

      visit root_path

      click_on "API Info"

      expect(current_path).to eq(api_path)
      expect(page).to have_content("Vicarious.li's API documentation")
    end
  end
end
