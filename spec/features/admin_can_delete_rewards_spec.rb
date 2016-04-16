require 'rails_helper'

RSpec.feature "Admin deletes a reward" do
  scenario "deletes an existing reward" do
    reward = create(:reward)

    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Shop"

    expect(page).to have_content("#{reward.name}: #{reward.value}")
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
    click_button "Delete"

    expect(page).to have_content("Rewards Index")
    expect(page).to_not have_content("#{reward.name}: #{reward.value}")
    expect(page).to_not have_button("Edit")
    expect(page).to_not have_button("Delete")
  end
end
