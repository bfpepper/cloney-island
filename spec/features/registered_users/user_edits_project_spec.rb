# require "rails_helper"
#
# describe "User can edit their project" do
#   it "User is able to edit their project" do
#     cat = create(:category)
#     project = create(:project, category_id: cat.id)
#
#     visit project_path(project.slug)
#
#     click_on "Edit Your Project"
#
#     expect(current_path).to eq(edit_project_path(project.slug))
#
#     fill_in "Name", with: "The New Hotness"
#
#     click_on "Update"
#
#     expect(current_path).to eq(project_path(project))
#     expect(page).to have_content("The New Hotness")
#   end
# end
