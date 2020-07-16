# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_07_16_131521) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cinemas", force: :cascade do |t|
    t.string "name"
    t.string "ville"
    t.string "allocine_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "events", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "cinema_id"
    t.bigint "seance_id"
    t.integer "schedule"
    t.date "date"
    t.integer "endschedule"
    t.index ["cinema_id"], name: "index_events_on_cinema_id"
    t.index ["seance_id"], name: "index_events_on_seance_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "position"
    t.index ["film_id"], name: "index_favorites_on_film_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "films", force: :cascade do |t|
    t.string "photo_url"
    t.string "title"
    t.text "synopsis"
    t.string "duration"
    t.string "genre", array: true
    t.float "rate_press"
    t.float "rate_viewer"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "allocine_id"
    t.datetime "date_release"
  end

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "requester_id"
    t.bigint "requested_id"
    t.index ["requested_id"], name: "index_friend_requests_on_requested_id"
    t.index ["requester_id"], name: "index_friend_requests_on_requester_id"
  end

  create_table "friendships", id: :serial, force: :cascade do |t|
    t.string "friendable_type"
    t.integer "friendable_id"
    t.integer "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "blocker_id"
    t.integer "status"
    t.index ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true
  end

  create_table "guests", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "status", default: 0
    t.index ["event_id"], name: "index_guests_on_event_id"
    t.index ["user_id"], name: "index_guests_on_user_id"
  end

  create_table "seances", force: :cascade do |t|
    t.bigint "cinema_id", null: false
    t.bigint "film_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "horaire"
    t.string "link"
    t.string "allocine_id"
    t.index ["cinema_id"], name: "index_seances_on_cinema_id"
    t.index ["film_id"], name: "index_seances_on_film_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "phone"
    t.string "nom"
    t.string "prenom"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "cinemas"
  add_foreign_key "events", "seances"
  add_foreign_key "favorites", "films"
  add_foreign_key "favorites", "users"
  add_foreign_key "guests", "events"
  add_foreign_key "guests", "users"
  add_foreign_key "seances", "cinemas"
  add_foreign_key "seances", "films"
end
