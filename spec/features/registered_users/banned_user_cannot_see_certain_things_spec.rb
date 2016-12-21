require "rails_helper"

describe "Banned user viewing" do

  before(:each) do
    @user = create(:user_with_projects)
    @project = @user.projects.first
    @user.banned!
  end
  scenario "A banned user cannot create a project" do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit new_project_path
    expect(page).to have_content("The page you were looking for doesn't exist (404)")

  end
  scenario "user cannot edit their existing project" do

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit edit_project_path(@project)
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  scenario "user cannot back a project" do
    user = create(:user_with_projects)
    project = user.projects.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit projects_new_pledge_path(project.slug)
    expect(page).to have_content("The page you were looking for doesn't exist (404)")
  end

  scenario "banned user cannot comment on their backed projects" do
    @user.active!
    @user.roles << Role.create(name: "registered")
    Role.create(name: "backer")
    user = create(:user_with_projects)
    project = user.projects.first

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    visit project_path(project.slug)

    expect(find('div.progress-bar')['aria-valuenow']).to eq('0')

    click_on "Back project!"

    fill_in :pledge_amount_given, with: 50
    fill_in :password, with: @user.password
    click_on "Back project!"

    expect(current_path).to eq(project_path(project.slug))

    expect(page).to have_button("Post Your Comment")

    @user.banned!

    visit project_path(project.slug)

    expect(page).to_not have_content("Post Your Comment")
  end
end
