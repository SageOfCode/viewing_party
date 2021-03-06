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

ActiveRecord::Schema.define(version: 2020_12_10_022539) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friendships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "friend_id"
  end

  create_table "movie_parties", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "user_id"
    t.string "date"
    t.string "time"
    t.index ["movie_id"], name: "index_movie_parties_on_movie_id"
    t.index ["user_id"], name: "index_movie_parties_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.integer "api_id"
    t.string "duration"
  end

  create_table "party_guests", force: :cascade do |t|
    t.bigint "movie_party_id"
    t.bigint "friendship_id"
    t.index ["friendship_id"], name: "index_party_guests_on_friendship_id"
    t.index ["movie_party_id"], name: "index_party_guests_on_movie_party_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.string "username"
  end

  add_foreign_key "movie_parties", "movies"
  add_foreign_key "movie_parties", "users"
  add_foreign_key "party_guests", "friendships"
  add_foreign_key "party_guests", "movie_parties"
end
