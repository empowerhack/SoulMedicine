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

ActiveRecord::Schema.define(version: 20160927100217) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "countries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "iso_code",   limit: 255
    t.integer  "dial_code",  limit: 4
    t.boolean  "is_active",              default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.integer  "order",       limit: 4
    t.boolean  "is_active",                 default: true, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string   "gender",     limit: 255
    t.boolean  "is_active",              default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_active",              default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "lesson_completions", force: :cascade do |t|
    t.integer  "lesson_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "lesson_completions", ["lesson_id"], name: "index_lesson_completions_on_lesson_id", using: :btree
  add_index "lesson_completions", ["user_id"], name: "index_lesson_completions_on_user_id", using: :btree

  create_table "lesson_translations", force: :cascade do |t|
    t.integer  "lesson_id",   limit: 4
    t.integer  "language_id", limit: 4
    t.text     "translation", limit: 65535
    t.boolean  "is_approved",               default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "lesson_translations", ["lesson_id", "language_id"], name: "index_lesson_translations_on_lesson_id_and_language_id", unique: true, using: :btree

  create_table "lessons", force: :cascade do |t|
    t.integer  "subject_matter_id", limit: 4
    t.string   "name",              limit: 255
    t.integer  "order",             limit: 4,                   null: false
    t.boolean  "is_approved",                   default: false, null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "lessons", ["subject_matter_id"], name: "index_lessons_on_subject_matter_id", using: :btree

  create_table "message_services", force: :cascade do |t|
    t.string   "service",    limit: 255
    t.boolean  "is_active",              default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "subject_matters", force: :cascade do |t|
    t.string   "name",        limit: 255,                  null: false
    t.text     "description", limit: 65535
    t.integer  "order",       limit: 4,                    null: false
    t.boolean  "is_active",                 default: true, null: false
    t.integer  "course_id",   limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "subject_matters", ["course_id"], name: "index_subject_matters_on_course_id", using: :btree

  create_table "translations", force: :cascade do |t|
    t.string   "locale",         limit: 255
    t.string   "key",            limit: 255
    t.text     "value",          limit: 65535
    t.text     "interpolations", limit: 65535
    t.boolean  "is_proc",                      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_courses", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "course_id",   limit: 4
    t.boolean  "is_complete",           default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "user_courses", ["course_id"], name: "index_user_courses_on_course_id", using: :btree
  add_index "user_courses", ["user_id"], name: "index_user_courses_on_user_id", using: :btree

  create_table "user_preferences", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4,                       null: false
    t.integer  "gender_id",               limit: 4,   default: 3
    t.integer  "native_language_id",      limit: 4
    t.integer  "other_language_one_id",   limit: 4
    t.integer  "other_language_two_id",   limit: 4
    t.integer  "origin_country_id",       limit: 4
    t.integer  "country_of_residence_id", limit: 4
    t.boolean  "consent",                             default: false,     null: false
    t.date     "age"
    t.integer  "message_service_one_id",  limit: 4,   default: 1
    t.integer  "message_service_two_id",  limit: 4
    t.string   "first_name",              limit: 255
    t.string   "last_name",               limit: 255
    t.string   "email",                   limit: 255
    t.string   "password_digest",         limit: 255
    t.datetime "created_at",                                              null: false
    t.datetime "updated_at",                                              null: false
    t.string   "delivery_time",           limit: 255, default: "morning"
  end

  add_index "user_preferences", ["country_of_residence_id"], name: "index_user_preferences_on_country_of_residence_id", using: :btree
  add_index "user_preferences", ["message_service_one_id"], name: "index_user_preferences_on_message_service_one_id", using: :btree
  add_index "user_preferences", ["message_service_two_id"], name: "index_user_preferences_on_message_service_two_id", using: :btree
  add_index "user_preferences", ["native_language_id"], name: "index_user_preferences_on_native_language_id", using: :btree
  add_index "user_preferences", ["origin_country_id"], name: "index_user_preferences_on_origin_country_id", using: :btree
  add_index "user_preferences", ["other_language_one_id"], name: "index_user_preferences_on_other_language_one_id", using: :btree
  add_index "user_preferences", ["other_language_two_id"], name: "index_user_preferences_on_other_language_two_id", using: :btree
  add_index "user_preferences", ["user_id", "gender_id"], name: "index_user_preferences_on_user_id_and_gender_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "mobile_number", limit: 8
    t.string   "pin",           limit: 255
    t.boolean  "verified",                  default: false
    t.integer  "country_id",    limit: 4
    t.integer  "language_id",   limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  add_index "users", ["country_id", "language_id"], name: "index_users_on_country_id_and_language_id", using: :btree

  add_foreign_key "lesson_completions", "lessons"
  add_foreign_key "lesson_completions", "users"
  add_foreign_key "lessons", "subject_matters"
  add_foreign_key "subject_matters", "courses"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users"
end
