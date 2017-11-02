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

ActiveRecord::Schema.define(version: 20171102164323) do

  create_table "tokens", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "user_id", null: false
    t.string "refresh_token", limit: 128, null: false
    t.integer "expires_in", null: false
    t.string "uid", limit: 32, null: false
    t.string "token_type", limit: 16, null: false
    t.string "scope", limit: 96, null: false
    t.string "access_token", limit: 128, null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "uid", limit: 64, null: false
    t.string "full_name", limit: 32, null: false
    t.timestamp "last_heartbeat"
    t.string "last_plugin_name", limit: 32
    t.string "last_project", limit: 32
    t.string "location", limit: 96
    t.string "username", limit: 64
    t.string "website", limit: 32
  end

end
