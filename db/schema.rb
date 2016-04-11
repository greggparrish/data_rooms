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

ActiveRecord::Schema.define(version: 20160411200136) do

  create_table "assets", force: :cascade do |t|
    t.integer  "document_id",  limit: 4
    t.integer  "project_id",   limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "approved",     limit: 1, default: 0, null: false
    t.integer  "suggested_by", limit: 4
  end

  add_index "assets", ["document_id"], name: "index_assets_on_document_id", using: :btree
  add_index "assets", ["project_id"], name: "index_assets_on_project_id", using: :btree

  create_table "doc_permissions", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "document_id", limit: 4
    t.datetime "expires"
    t.integer  "abilities",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "doc_permissions", ["document_id"], name: "index_doc_permissions_on_document_id", using: :btree
  add_index "doc_permissions", ["user_id"], name: "index_doc_permissions_on_user_id", using: :btree

  create_table "doctrees", force: :cascade do |t|
    t.integer  "document_id", limit: 4
    t.integer  "folder_id",   limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "documents", force: :cascade do |t|
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "doc_file",          limit: 255
    t.string   "file_content_type", limit: 255
    t.integer  "file_size",         limit: 4
    t.datetime "file_updated_at"
    t.text     "description",       limit: 65535
    t.integer  "user_id",           limit: 4
    t.string   "title",             limit: 255
    t.string   "original_filename", limit: 255
  end

  add_index "documents", ["user_id"], name: "index_documents_on_user_id", using: :btree

  create_table "folders", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "slug",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "project_id", limit: 4
  end

  add_index "folders", ["project_id"], name: "index_project_id", using: :btree
  add_index "folders", ["slug"], name: "index_folders_on_slug", unique: true, using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "team_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "abilities",  limit: 4
    t.datetime "expiration"
    t.boolean  "approved",   limit: 1, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "thumbnail",   limit: 255
    t.string   "slug",        limit: 255
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true, using: :btree

  create_table "stakeholders", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "project_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "abilities",  limit: 4
    t.datetime "expiration"
    t.boolean  "approved",   limit: 1, null: false
  end

  add_index "stakeholders", ["project_id"], name: "index_stakeholders_on_project_id", using: :btree
  add_index "stakeholders", ["user_id"], name: "index_stakeholders_on_user_id", using: :btree

  create_table "teams", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "thumbnail",   limit: 255
  end

  create_table "users", force: :cascade do |t|
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
    t.string   "username",               limit: 255
    t.string   "title",                  limit: 255
    t.string   "company",                limit: 255
    t.string   "avatar",                 limit: 255
    t.datetime "avatar_updated_at"
    t.string   "name",                   limit: 255
    t.string   "slug",                   limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "documents", "users"
end
