require 'rails_helper'

describe 'User can comment on a project' do
  context 'if the user is a backer of the project' do
    scenario 'They enter a comment in the text field and click button and see the comment' do
      user = create(:user)
      project = create(:project)
      pledge = create(:pledge, user: user, project: project)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit project_path(project.slug)
      click_on "Comments"
      
    end
  end
end
