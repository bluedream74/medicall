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

ActiveRecord::Schema[7.0].define(version: 2023_07_09_043518) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clinic_customers", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.bigint "customer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_clinic_customers_on_clinic_id"
    t.index ["customer_id"], name: "index_clinic_customers_on_customer_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "tel"
    t.text "access"
    t.string "holiday"
    t.string "reserve"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "phone_number"
    t.string "patient_number"
    t.string "name"
    t.boolean "is_white_list", default: false, null: false
    t.boolean "is_black_list", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "clinic_id", null: false
    t.integer "day_of_week"
    t.integer "session"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_schedules_on_clinic_id"
  end

  create_table "user_clinics", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "clinic_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_user_clinics_on_clinic_id"
    t.index ["user_id"], name: "index_user_clinics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "confirmed_at"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unconfirmed_email"], name: "index_users_on_unconfirmed_email"
  end

  add_foreign_key "clinic_customers", "clinics"
  add_foreign_key "clinic_customers", "customers"
  add_foreign_key "schedules", "clinics"
  add_foreign_key "user_clinics", "clinics"
  add_foreign_key "user_clinics", "users"
end
