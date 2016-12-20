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

ActiveRecord::Schema.define(version: 20161220002854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "name"
    t.string   "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "comment_body"
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_comments_on_project_id", using: :btree
    t.index ["user_id"], name: "index_comments_on_user_id", using: :btree
  end

  create_table "pledges", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "amount_given"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["project_id"], name: "index_pledges_on_project_id", using: :btree
    t.index ["user_id"], name: "index_pledges_on_user_id", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.text     "title"
    t.text     "description"
    t.integer  "goal"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "slug"
    t.integer  "category_id"
    t.string   "banner_image_file_name"
    t.string   "banner_image_content_type"
    t.integer  "banner_image_file_size"
    t.datetime "banner_image_updated_at"
    t.index ["category_id"], name: "index_projects_on_category_id", using: :btree
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_projects", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_user_projects_on_project_id", using: :btree
    t.index ["user_id"], name: "index_user_projects_on_user_id", using: :btree
  end

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id", using: :btree
    t.index ["user_id"], name: "index_user_roles_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "email_confirmation"
    t.string   "verification_code"
    t.string   "api_key"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "pledges", "projects"
  add_foreign_key "pledges", "users"
  add_foreign_key "projects", "categories"
  add_foreign_key "user_projects", "projects"
  add_foreign_key "user_projects", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
