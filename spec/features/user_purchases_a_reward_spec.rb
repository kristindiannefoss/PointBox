require 'rails_helper'

RSpec.feature "User purchases a reward" do
    scenario "user has enough points to purchase the reward" do
      user   = User.create(username: "Kris",
                           password: "password",
                           role:     0)

      reward = Reward.create(name: "Cake", value: 2)

      # points = Point.create(value: 10, user_id: user.id)

      visit rewards_path
      click_button "Purchase"

      expect(page).to have_content("My Rewards")
      expect(page).to have_content("Cake")
    end
end
