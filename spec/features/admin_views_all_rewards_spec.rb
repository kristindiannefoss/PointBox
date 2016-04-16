require 'rails_helper'

RSpec.feature "Admin views all rewards" do
  scenario "sees index page" do
    # reward = create_list(:reward, 4)

    reward = Reward.create(name: "this", value: 2)
    reward2 = Reward.create(name: "that", value: 3)

    admin  = User.create(username: "admin",
                         password: "password",
                         role:     1)

    visit login_path
    fill_in "username", with: "admin"
    fill_in "password", with: "password"
    click_button "Login"

    click_link "Rewards Shop"

    expect(page).to have_content("this")
    expect(page).to have_content("that")
    expect(page).to have_button("Edit")
    expect(page).to have_button("Delete")
  end
end
