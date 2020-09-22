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

ActiveRecord::Schema.define(version: 2020_09_22_131822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bodies", force: :cascade do |t|
    t.float "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pet_id"
    t.date "recorded_date"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "vitality"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "defecation"
    t.string "urination"
    t.string "appetite"
    t.string "vomit"
    t.text "comment"
    t.string "staff"
    t.string "medicine"
    t.integer "pet_id"
    t.string "recorded_at"
    t.date "recorded_date"
  end

  create_table "contact_mailers", force: :cascade do |t|
    t.string "name"
    t.text "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pets", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.integer "age"
    t.date "birthday"
    t.string "breed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sex"
    t.integer "user_id"
    t.index ["name"], name: "index_pets_on_name"
  end

  create_table "reservations", force: :cascade do |t|
    t.date "start"
    t.date "end"
    t.integer "pet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["start", "end"], name: "index_reservations_on_start_and_end"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "firstname", null: false
    t.string "lastname"
    t.string "address"
    t.string "tel"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["firstname", "lastname", "tel"], name: "index_users_on_firstname_and_lastname_and_tel"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
