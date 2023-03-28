# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20221211012049) do

  create_table "admins", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "email_id"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "educations", force: :cascade do |t|
    t.float    "gpa"
    t.string   "college_name"
    t.string   "degree"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "student_id"
  end

  add_index "educations", ["student_id"], name: "index_educations_on_student_id"

  create_table "faculties", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "email_id"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "university_name"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "conversation_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id"
  add_index "messages", ["user_id"], name: "index_messages_on_user_id"

  create_table "programs", force: :cascade do |t|
    t.string   "university_name"
    t.string   "program_name"
    t.string   "department"
    t.string   "degree"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.integer  "user_id"
    t.integer  "student_application_id"
    t.string   "comment"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "scores", force: :cascade do |t|
    t.integer  "sat"
    t.integer  "act"
    t.integer  "gre"
    t.integer  "toefl"
    t.float    "ielts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "scores", ["student_id"], name: "index_scores_on_student_id"

  create_table "student_applications", force: :cascade do |t|
    t.integer  "application_id"
    t.string   "university_name"
    t.string   "program"
    t.string   "degree"
    t.string   "year_start"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "attended_university_name"
    t.string   "university_degree"
    t.float    "gpa"
    t.integer  "sat"
    t.integer  "act"
    t.integer  "gre"
    t.integer  "toefl"
    t.float    "ielts"
    t.integer  "student_id"
    t.integer  "education_id"
    t.integer  "score_id"
    t.integer  "rating_id"
    t.string   "status",                   default: "Pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.string   "email_id"
    t.string   "phone"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "universities", force: :cascade do |t|
    t.integer  "university_id"
    t.string   "university_name"
    t.integer  "enrollment"
    t.float    "acceptance_rate"
    t.integer  "average_cost"
    t.string   "standardized_test_required"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",            null: false
    t.string   "encrypted_password",     default: "",            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "status",                 default: "Unconfirmed"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.integer  "role",                   default: 0
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
