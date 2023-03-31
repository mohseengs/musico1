# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_22_122905) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer "follower_id", null: false
    t.integer "following_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "group_sessions", force: :cascade do |t|
    t.integer "group_admin_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_admin_id"], name: "index_group_sessions_on_group_admin_id"
  end

  create_table "group_sessions_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_session_id", null: false
  end

  create_table "histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "playable_type"
    t.integer "playable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["playable_type", "playable_id"], name: "index_histories_on_playable"
    t.index ["user_id"], name: "index_histories_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "likes", force: :cascade do |t|
    t.string "likeable_type", null: false
    t.integer "likeable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["likeable_type", "likeable_id"], name: "index_likes_on_likeable"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "notifiable_type", null: false
    t.integer "notifiable_id", null: false
    t.integer "status", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "playlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_playlists_on_user_id"
  end

  create_table "playlists_songs", id: false, force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "playlist_id", null: false
  end

  create_table "song_queues", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "current_pointter"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_song_queues_on_user_id"
  end

  create_table "song_queues_songs", id: false, force: :cascade do |t|
    t.integer "song_id", null: false
    t.integer "song_queue_id", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "name"
    t.integer "language_id"
    t.integer "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_songs_on_category_id"
    t.index ["language_id"], name: "index_songs_on_language_id"
  end

  create_table "songs_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "song_id", null: false
  end

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.date "dob"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "group_sessions", "users", column: "group_admin_id"
  add_foreign_key "histories", "users"
  add_foreign_key "likes", "users"
  add_foreign_key "notifications", "users"
  add_foreign_key "playlists", "users"
  add_foreign_key "song_queues", "users"
  add_foreign_key "songs", "categories"
  add_foreign_key "songs", "languages"
end
