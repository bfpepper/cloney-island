require "rails_helper"

describe "user sees project via category" do
  it "A user can visit a given project through the category page" do
    category = create(:category_with_projects)
    user = create(:user_with_projects)
    project = user.projects.first

    visit category_path(project.category.slug)

    click_on "#{project.title}"

    expect(current_path).to eq(project_path(project.slug))
    expect(page).to have_content("#{project.title}")
    expect(page).to have_content("#{project.description}")
    expect(page).to have_content("#{project.goal}")
  end
end
