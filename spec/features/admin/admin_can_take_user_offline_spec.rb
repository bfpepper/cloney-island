require "rails_helper"

describe "Admin modifys users" do
  scenario "admin can take a user offline" do
    admin = create(:user)
    admin.roles << Role.create(name: "admin")
    user1, user2 = create_list(:user, 2)
    user1.roles << Role.create(name: "registered")
    user2.roles << Role.create(name: "registered")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    within('div#1') do
      click_on "Change Status"
    end

    expect(current_path).to eq(admin_edit_user_path(user1))

    fill_in "user[reason_for_status_change]", with: "Because we said so!"

    click_on("Change Status")

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content("#{user1.name} has been taken off line. Reason: #{user1.reason_for_status_change}")
  end

  scenario "admin can resurrect user" do
    admin = create(:user)
    admin.roles << Role.create(name: "admin")
    user1, user2 = create_list(:user, 2)
    user1.roles << Role.create(name: "registered")
    user2.roles << Role.create(name: "registered")
    user1.banned!

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_users_path

    within('div#2') do
      click_on "Change Status"
    end

    expect(current_path).to eq(admin_edit_user_path(user1))

    fill_in "user[reason_for_status_change]", with: "Because we said so!"

    click_on("Change Status")

    expect(current_path).to eq(admin_users_path)
    expect(page).to have_content("#{user1.name} has been resurrected. Reason: #{user1.reason_for_status_change}")
  end
end
