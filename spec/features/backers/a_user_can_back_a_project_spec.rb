# require 'rails_helper'
#
# describe "As a user" do
#  context "when I visit a projects show page" do
#   scenario "I can back(give money) to a project" do
#       project = create(:project, name: "How to find a Job")
#       user = create(:user)
#       role = Role.create(name: "registered")
#       user.roles << role
#
#       visit project_path(project)
#       click_on "Back Project"
#
#       expect(page).to have_content("How to find a Job")
#       fill_in :amount with 50
#
#       expect(current_path).to eq(something)
#       #need some more expectations
#     end
#   end
# end
