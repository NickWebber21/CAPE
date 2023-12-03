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

ActiveRecord::Schema[7.0].define(version: 2023_12_03_005737) do
  create_table "authors", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "presentation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["presentation_id"], name: "index_authors_on_presentation_id"
    t.index ["user_id"], name: "index_authors_on_user_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "presentation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "clear_topic_intro", null: false
    t.integer "clear_direction_intro", null: false
    t.integer "logical_sequence", null: false
    t.integer "good_summary_conclusion", null: false
    t.integer "enough_information", null: false
    t.integer "free_from_filler", null: false
    t.integer "filled_time", null: false
    t.integer "easily_follow", null: false
    t.integer "presenter_clear_understanding", null: false
    t.integer "consistent_findings", null: false
    t.integer "questions_answered", null: false
    t.integer "effective_visuals", null: false
    t.integer "legible_visuals", null: false
    t.integer "proper_grammar", null: false
    t.integer "visuals_enhance", null: false
    t.integer "appropriate_timing_visuals", null: false
    t.integer "clear_delivery", null: false
    t.integer "effective_body_language", null: false
    t.integer "eye_contact", null: false
    t.integer "overall_score", null: false
    t.text "comments"
    t.index ["presentation_id"], name: "index_evaluations_on_presentation_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "presentations", force: :cascade do |t|
    t.string "title", null: false
    t.string "course", null: false
    t.integer "grade"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "due_date", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first", null: false
    t.string "last", null: false
    t.json "courses"
    t.string "role", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "authors", "presentations"
  add_foreign_key "authors", "users"
  add_foreign_key "evaluations", "presentations"
  add_foreign_key "evaluations", "users"
end
