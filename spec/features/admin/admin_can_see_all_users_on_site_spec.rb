require "rails_helper"

describe "admin user index page" do
  it "as an admin I can see all users whoa re registered with the site" do
    user1, user2, user3 = create_list(:user, 3)
    role1 = Role.create(name: "registered")
    role2 = Role.create(name: "admin")
    user1.roles << role1
    user2.roles << role1
    user3.roles << role2

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user3)

    visit admin_users_path

    expect(page).to have_content("#{user1.name}")
    expect(page).to have_link("#{user1.name}")
    expect(page).to have_content("#{user2.name}")
    expect(page).to have_link("#{user2.name}")
  end
end
