require 'rails_helper'

RSpec.feature "Admin can edit a reward" do
  scenario "edits an existing reward" do
    reward = create(:reward)

    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Shop"
    click_button "Edit"

    fill_in "name", with: "Thing"
    fill_in "value", with: "2"
    click_button "Update Reward"

    expect(page).to have_content("Thing")
    expect(page).to have_content("2")
  end
end
