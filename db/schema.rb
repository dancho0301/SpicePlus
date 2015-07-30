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

ActiveRecord::Schema.define(version: 20150724135541) do

  create_table "areas", force: true do |t|
    t.string "name"
  end

  create_table "article_images", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_lines", force: true do |t|
    t.integer  "article_id"
    t.integer  "line_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_plans", force: true do |t|
    t.integer  "article_id"
    t.string   "title"
    t.text     "description"
    t.string   "color_theme"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "article_recommends", force: true do |t|
    t.integer "article_id"
    t.string  "description"
  end

  create_table "article_schedules", force: true do |t|
    t.integer  "article_id"
    t.string   "time"
    t.string   "title"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "articles", force: true do |t|
    t.string   "title"
    t.date     "publication_date"
    t.string   "description"
    t.text     "article"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "genre_id"
    t.integer  "area_id"
    t.integer  "group_id"
    t.integer  "spice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "favorites",          default: 0
  end

  create_table "entry", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "tel"
    t.text     "comment"
    t.integer  "article_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "genres", force: true do |t|
    t.string   "name"
    t.string   "css_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "master_name"
    t.string   "address"
    t.string   "tel"
    t.string   "url"
    t.string   "mail"
    t.text     "activity"
    t.text     "detail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inquiries", force: true do |t|
    t.string  "family_name"
    t.string  "first_name"
    t.string  "family_name_kana"
    t.string  "first_name_kana"
    t.string  "email"
    t.string  "message"
    t.integer "article_id"
  end

  create_table "lines", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "members", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "redactor_assets", force: true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "reports", force: true do |t|
    t.integer  "article_id"
    t.string   "name"
    t.string   "title"
    t.date     "report_date"
    t.text     "report_body"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "point"
    t.integer  "main_reporter"
    t.string   "signature"
    t.integer  "spice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spices", force: true do |t|
    t.string   "name"
    t.string   "css_class"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username",                                        null: false
    t.string   "email",                                           null: false
    t.string   "crypted_password",                                null: false
    t.string   "salt",                                            null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "administrator",                   default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token"

end
