# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160414202224) do

  create_table "rewards", force: :cascade do |t|
    t.string  "name"
    t.integer "value"
  end

  create_table "users", force: :cascade do |t|
    t.string  "username"
    t.string  "password_digest"
    t.string  "password_confirmation"
    t.integer "role"
    t.integer "unspent_points"
    t.integer "spent_points"
  end

  create_table "users_rewards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "reward_id"
  end

  add_index "users_rewards", ["reward_id"], name: "index_users_rewards_on_reward_id"
  add_index "users_rewards", ["user_id"], name: "index_users_rewards_on_user_id"

end
