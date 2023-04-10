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

ActiveRecord::Schema.define(version: 2023_04_09_054351) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "calendars", force: :cascade do |t|
    t.integer "post_id", null: false
    t.datetime "visit_day"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_calendars_on_post_id"
  end

  create_table "commuting_to_hospitals", force: :cascade do |t|
    t.integer "user_id"
    t.string "hospital_name"
    t.date "day_of_a_hospital_visit"
    t.text "objective"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "graphs", force: :cascade do |t|
    t.integer "post_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["post_id"], name: "index_graphs_on_post_id"
  end

  create_table "mental_manifestations", force: :cascade do |t|
    t.integer "post_id"
    t.boolean "mental_good"
    t.boolean "mental_normal"
    t.boolean "frustrating"
    t.boolean "hot_tempered"
    t.boolean "emotional_instability"
    t.boolean "emotional"
    t.boolean "uneasiness"
    t.boolean "poor_concentrtion"
    t.boolean "lethargy"
    t.boolean "melancholy"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "physical_symptoms", force: :cascade do |t|
    t.integer "post_id"
    t.boolean "physical_good"
    t.boolean "no_malfunction"
    t.boolean "tired"
    t.boolean "washed_out_feeling"
    t.boolean "lumbago"
    t.boolean "stomach_ache"
    t.boolean "headache"
    t.boolean "rough_skin"
    t.boolean "chilling_exposure"
    t.boolean "swelling"
    t.boolean "sleepiness"
    t.boolean "increased_appetite"
    t.boolean "low_appetite"
    t.boolean "chest_pain"
    t.boolean "nausea"
    t.boolean "dazziness"
    t.boolean "pollakiuria"
    t.boolean "hot_flash"
    t.integer "defecute"
    t.integer "vaginal_discharge"
    t.integer "vaginal_discharge_type"
    t.integer "vaginal_bleeding"
    t.integer "sex"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "physiologies", force: :cascade do |t|
    t.integer "post_id"
    t.integer "menstrual_blood_volume"
    t.integer "cramps"
    t.boolean "medicine", default: false, null: false
    t.date "physiology_start_date"
    t.date "physiology_end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text "posted_text"
    t.float "temperature"
    t.float "weight"
    t.float "body_fat_percentage"
    t.datetime "start_time", null: false
    t.boolean "release", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pregnancies", force: :cascade do |t|
    t.integer "post_id"
    t.boolean "morning_sickness"
    t.boolean "belching"
    t.boolean "backache_during_pregnancy"
    t.boolean "anaemia"
    t.boolean "sour_stomach"
    t.boolean "pulsation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_deleted", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "calendars", "posts"
  add_foreign_key "graphs", "posts"
end
