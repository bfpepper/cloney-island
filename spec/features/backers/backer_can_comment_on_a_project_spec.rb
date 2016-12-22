require 'rails_helper'

describe 'User can comment on a project' do
  context 'if the user is a backer of the project' do
    xscenario 'They enter a comment in the text field and click button and see the comment', :js => true do
      user = create(:user)
      project = create(:project)
      project.users << user
      pledge = create(:pledge, user: user, project: project)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project.slug)
      click_on "Comments"
      fill_in "comment-body", with: "Love this project"
      click_on "Post Your Comment"

      expect(page).to have_content(user.name)
      expect(page).to have_content("Love this project")
    end
  end
end
