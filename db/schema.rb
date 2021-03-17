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

ActiveRecord::Schema.define(version: 2021_03_17_035311) do

  create_table "properties", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "host_id"
    t.string "property_name"
    t.integer "property_type"
    t.integer "check_in_time"
    t.integer "check_out_time"
    t.string "property_description"
    t.integer "rates"
    t.integer "service_fee"
    t.integer "cleaning_fee"
    t.integer "capacity"
    t.integer "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "wifi"
    t.boolean "swimming_pool"
    t.boolean "parking"
    t.boolean "restaurant"
    t.boolean "twenty_four_hour_front_desk"
    t.boolean "fitness_center"
    t.boolean "airport_transfer"
    t.boolean "pay_upon_checkin"
    t.boolean "family_friendly"
    t.boolean "near_mrt_station"
    t.boolean "no_cancellation_fee"
    t.boolean "cancellation_fee"
    t.integer "cancellation_fee_price"
    t.boolean "no_smoking"
    t.boolean "pets_allowed"
    t.boolean "no_parties"
    t.boolean "other_rules"
    t.string "other_rules_description"
    t.boolean "smoke_alarm"
    t.boolean "security_guards"
    t.boolean "cctvs_equipped"
    t.boolean "near_hospitals"
    t.boolean "safety_deposit_box"
    t.boolean "smoking_area"
    t.boolean "twenty_four_hour_security"
    t.boolean "elevator"
    t.boolean "disabled_access_friendly"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birthdate"
    t.string "languages"
    t.integer "contact_number"
    t.string "profile_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
