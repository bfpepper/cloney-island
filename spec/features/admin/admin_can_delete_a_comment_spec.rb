require 'rails_helper'

describe "an admin is logged in" do
	context "and is viewing a project page" do
	 scenario "the admin deletes a bad comment" do
		admin = create(:user)
		role = Role.create(name: "admin")
		admin.roles << role
		user = create(:user_with_projects)
		project = user.projects.first
    bad_user = create(:user)
		bad_comment = bad_user.comments.create(comment_body: "lolololol goonfleet 4ever", project_id: project.id)
		good_comment = user.comments.create(comment_body: "love too comment on the internet", project_id: project.id)
	  
		allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

		visit project_path(project.slug)
		
		expect(page).to have_content(bad_comment.comment_body)
		expect(page).to have_content(good_comment.comment_body)
		expect(page).to have_link("Delete Comment")

		within("div#1") do
			click_on "Delete Comment"
		end
		
		expect(current_path).to eq(project_path(project.slug))
		expect(page).to_not have_content(bad_comment.comment_body)
		expect(page).to have_content(good_comment.comment_body)

		end
	end
end
