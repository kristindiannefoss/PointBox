class CreateUsersRewards < ActiveRecord::Migration
  def change
    create_table :users_rewards do |t|
      t.references :user, index: true, foreign_key: true
      t.references :reward, index: true, foreign_key: true
    end
  end
end
