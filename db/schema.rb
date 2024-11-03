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

ActiveRecord::Schema[7.2].define(version: 2024_11_03_091515) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "BookingServices", id: :serial, force: :cascade do |t|
    t.integer "bookingId"
    t.integer "serviceId"
    t.integer "quantity"
    t.timestamptz "createdAt", null: false
    t.timestamptz "updatedAt", null: false
  end

  create_table "administrators", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "agency_id"
    t.integer "role", default: 1
  end

  create_table "agencies", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "administrator_id"
    t.string "name", limit: 255
    t.text "description"
    t.string "address", limit: 255
    t.string "phone_number", limit: 255
    t.string "image", limit: 255
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.integer "capacity"
    t.integer "lobby"
  end

  create_table "arkhams", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.text "description", null: false
    t.float "price", null: false
    t.integer "agency_id"
    t.json "images"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "password", limit: 255, null: false
    t.timestamptz "created_at"
    t.timestamptz "updated_at"

    t.unique_constraint ["email"], name: "users_email_key"
    t.unique_constraint ["username"], name: "users_username_key"
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.integer "agencyId"
    t.string "name", limit: 255
    t.string "address", limit: 255
    t.integer "capacity"
    t.decimal "price"
    t.text "description"
    t.string "image_url", limit: 255
    t.timestamptz "createdAt", null: false
    t.timestamptz "updatedAt", null: false
  end

  add_foreign_key "services", "agencies", name: "services_agency_id_fkey", on_update: :cascade, on_delete: :nullify
end
