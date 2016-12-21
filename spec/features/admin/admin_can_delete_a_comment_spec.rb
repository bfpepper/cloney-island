require 'rails_helper'

describe "an admin is logged in" do
	context "and is viewing a project page" do
	 xscenario "the admin deletes a bad comment" do
		admin = create(:user)
		role = Role.create(name: "admin")
		admin.roles << role
		user = create(:user_with_projects)
		project = user.projects.first
    bad_user = create(:user)
		bad_comment = bad_user.comments.create(comment_body: "lolololol goonfleet 4ever", project_id: project.id)
		good_comment = user.comments.create(comment_body: "love too comment on the internet", project_id: project.id)



				
		

	
		end
	end
end
