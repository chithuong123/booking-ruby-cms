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

ActiveRecord::Schema[7.2].define(version: 2024_10_02_062830) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "BookingServices", id: :serial, force: :cascade do |t|
    t.integer "bookingId"
    t.integer "serviceId"
    t.integer "quantity"
    t.timestamptz "createdAt", null: false
    t.timestamptz "updatedAt", null: false
  end

  create_table "SequelizeMeta", primary_key: "name", id: { type: :string, limit: 255 }, force: :cascade do |t|
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
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.string "image"
  end

  create_table "booking_services", id: :serial, force: :cascade do |t|
    t.integer "booking_id"
    t.integer "service_id"
    t.integer "quantity"
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
  end

  create_table "bookings", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "agency_id"
    t.integer "service_id"
    t.integer "venue_id"
    t.timestamptz "booking_date"
    t.timestamptz "event_date"
    t.string "status", limit: 255
    t.decimal "total_price"
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
  end

  create_table "services", id: :serial, force: :cascade do |t|
    t.integer "agency_id"
    t.string "name", limit: 255, null: false
    t.text "description", null: false
    t.float "price", null: false
    t.timestamptz "created_at"
    t.timestamptz "updated_at"
    t.json "images"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "username", limit: 255
    t.string "password", limit: 255
    t.string "role", limit: 255
    t.string "email", limit: 255
    t.string "phone_number", limit: 255
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false

    t.unique_constraint ["email"], name: "unique_email_constraint"
  end

  create_table "venues", id: :serial, force: :cascade do |t|
    t.integer "agency_id"
    t.string "name", limit: 255
    t.string "address", limit: 255
    t.integer "capacity"
    t.decimal "price"
    t.text "description"
    t.string "image_url", limit: 255
    t.timestamptz "created_at", null: false
    t.timestamptz "updated_at", null: false
  end

  add_foreign_key "services", "agencies", name: "services_agency_id_fkey", on_update: :cascade, on_delete: :nullify
end
