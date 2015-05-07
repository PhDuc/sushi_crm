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

ActiveRecord::Schema.define(version: 20150505014854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "apt_number"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "campaigns", force: true do |t|
    t.string   "type"
    t.string   "name"
    t.string   "external_id"
    t.integer  "limit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "campaigns", ["external_id"], name: "index_campaigns_on_external_id", using: :btree

  create_table "emails", force: true do |t|
    t.string   "email_address"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedback_questions", force: true do |t|
    t.string   "type"
    t.text     "content"
    t.string   "external_id"
    t.integer  "campaign_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedback_questions", ["campaign_id"], name: "index_feedback_questions_on_campaign_id", using: :btree
  add_index "feedback_questions", ["external_id"], name: "index_feedback_questions_on_external_id", using: :btree

  create_table "feedbacks", force: true do |t|
    t.string   "type"
    t.text     "content"
    t.text     "user_note"
    t.string   "external_id"
    t.integer  "feedback_question_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "feedbacks", ["external_id"], name: "index_feedbacks_on_external_id", using: :btree
  add_index "feedbacks", ["feedback_question_id"], name: "index_feedbacks_on_feedback_question_id", using: :btree
  add_index "feedbacks", ["user_id"], name: "index_feedbacks_on_user_id", using: :btree

  create_table "leads", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "score"
    t.integer  "remaining_time"
    t.boolean  "disabled",       default: false
    t.string   "email"
    t.string   "phone_number"
    t.string   "address"
    t.integer  "portal_user_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "phone_numbers", force: true do |t|
    t.string   "number"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "portal_users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.string   "crypted_password"
    t.string   "external_id"
    t.string   "legal_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password"
    t.string   "crypted_password"
    t.string   "external_id"
    t.boolean  "is_portal_user"
    t.integer  "portal_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "addresses", "users", name: "addresses_user_id_fk"

  add_foreign_key "emails", "users", name: "emails_user_id_fk"

  add_foreign_key "feedback_questions", "campaigns", name: "feedback_questions_campaign_id_fk"

  add_foreign_key "feedbacks", "feedback_questions", name: "feedbacks_feedback_question_id_fk"
  add_foreign_key "feedbacks", "users", name: "feedbacks_user_id_fk"

  add_foreign_key "leads", "portal_users", name: "leads_portal_user_id_fk"
  add_foreign_key "leads", "users", name: "leads_user_id_fk"

  add_foreign_key "phone_numbers", "users", name: "phone_numbers_user_id_fk"

  add_foreign_key "users", "portal_users", name: "users_portal_user_id_fk"

end
