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

ActiveRecord::Schema[7.1].define(version: 2025_07_28_032039) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "attachments", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "exercise_groups", force: :cascade do |t|
    t.bigint "workout_id", null: false
    t.integer "order"
    t.boolean "superset"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["workout_id"], name: "index_exercise_groups_on_workout_id"
  end

  create_table "exercise_sets", force: :cascade do |t|
    t.string "set_type"
    t.integer "reps"
    t.integer "order"
    t.float "load"
    t.bigint "unit_id", null: false
    t.integer "intensity"
    t.bigint "intensity_technique_id"
    t.bigint "exercise_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "suggested_intensity"
    t.index ["exercise_id"], name: "index_exercise_sets_on_exercise_id"
    t.index ["intensity_technique_id"], name: "index_exercise_sets_on_intensity_technique_id"
    t.index ["unit_id"], name: "index_exercise_sets_on_unit_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "name"
    t.text "notes"
    t.string "exercise_type"
    t.integer "rep_range_min"
    t.integer "rep_range_max"
    t.integer "rest_time"
    t.boolean "unilateral"
    t.bigint "exercise_group_id", null: false
    t.bigint "instrument_id", null: false
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "attachment_id"
    t.bigint "grip_id"
    t.integer "hole"
    t.boolean "body_weight", default: false
    t.index ["attachment_id"], name: "index_exercises_on_attachment_id"
    t.index ["exercise_group_id"], name: "index_exercises_on_exercise_group_id"
    t.index ["grip_id"], name: "index_exercises_on_grip_id"
    t.index ["instrument_id"], name: "index_exercises_on_instrument_id"
    t.index ["unit_id"], name: "index_exercises_on_unit_id"
  end

  create_table "grips", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name", null: false
    t.float "weight"
    t.bigint "unit_id", null: false
    t.bigint "grip_id"
    t.bigint "attachment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attachment_id"], name: "index_instruments_on_attachment_id"
    t.index ["grip_id"], name: "index_instruments_on_grip_id"
    t.index ["unit_id"], name: "index_instruments_on_unit_id"
  end

  create_table "intensity_techniques", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscle_groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "muscles", force: :cascade do |t|
    t.string "name"
    t.bigint "muscle_group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["muscle_group_id"], name: "index_muscles_on_muscle_group_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name"
    t.integer "frequency"
    t.string "level"
    t.string "goal"
    t.integer "duration"
    t.bigint "user_id", null: false
    t.bigint "unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["unit_id"], name: "index_programs_on_unit_id"
    t.index ["user_id"], name: "index_programs_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.string "unit_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "gender"
    t.float "weight"
    t.float "height"
    t.bigint "weight_unit_id"
    t.bigint "height_unit_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["height_unit_id"], name: "index_users_on_height_unit_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["weight_unit_id"], name: "index_users_on_weight_unit_id"
  end

  create_table "workouts", force: :cascade do |t|
    t.string "name"
    t.string "goal"
    t.integer "rest_days"
    t.bigint "program_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["program_id"], name: "index_workouts_on_program_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "exercise_groups", "workouts"
  add_foreign_key "exercise_sets", "exercises"
  add_foreign_key "exercise_sets", "intensity_techniques"
  add_foreign_key "exercise_sets", "units"
  add_foreign_key "exercises", "attachments"
  add_foreign_key "exercises", "exercise_groups"
  add_foreign_key "exercises", "grips"
  add_foreign_key "exercises", "instruments"
  add_foreign_key "instruments", "attachments"
  add_foreign_key "instruments", "grips"
  add_foreign_key "instruments", "units"
  add_foreign_key "muscles", "muscle_groups"
  add_foreign_key "programs", "users"
  add_foreign_key "users", "units", column: "height_unit_id"
  add_foreign_key "users", "units", column: "weight_unit_id"
  add_foreign_key "workouts", "programs"
end
