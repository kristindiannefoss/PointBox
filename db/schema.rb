ActiveRecord::Schema.define(version: 20160416223825) do

  enable_extension "plpgsql"

  create_table "points", force: :cascade do |t|
    t.integer "value"
    t.integer "user_id"
  end

  add_index "points", ["user_id"], name: "index_points_on_user_id", using: :btree

  create_table "rewards", force: :cascade do |t|
    t.string  "name"
    t.integer "value"
  end

  create_table "user_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
  end

  add_index "user_rewards", ["reward_id"], name: "index_user_rewards_on_reward_id", using: :btree
  add_index "user_rewards", ["user_id"], name: "index_user_rewards_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "password_confirmation"
    t.integer "role"
  end

  add_foreign_key "points", "users"
  add_foreign_key "user_rewards", "rewards"
  add_foreign_key "user_rewards", "users"
end
