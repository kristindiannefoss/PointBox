require 'rails_helper'


RSpec.feature "Admin can assign points to a user" do
  scenario "assigns point to an existing user" do
    user = create(:user)
    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)
    new_user  = User.create(username: "new",
                         password: "password",
                         role:     0)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Users Index"
    click_link "new"
    click_link "Add Points to new"
    fill_in "value", with: 1
    # fill_in "user id", with: user.id
    click_button "Assign"

    expect(page).to have_content("new: 1 points")
  end

  # scenario "trys to assign point without a user" do
  #   user = create(:user)
  #   admin  = User.create(username: "admin",
  #                        password: "password",
  #                        role:     1)
  #
  #   visit login_path
  #   fill_in "username", with: "admin"
  #   fill_in "password", with: "password"
  #   click_button "Login"
  #
  #   click_link "Assign Points"
  #   fill_in "value", with: 5
  #   click_button "Assign"
  #
  #   expect(page).to_not have_content("#{user.username}: 5 points")
  # end
end
