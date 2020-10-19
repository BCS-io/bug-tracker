# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_19_135255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.integer "role", default: 0
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
    t.index ["role"], name: "index_accounts_on_role"
    t.index ["username"], name: "index_accounts_on_username", unique: true
  end

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

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
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "issues", force: :cascade do |t|
    t.bigint "project_id", null: false
    t.bigint "account_id", null: false
    t.integer "work", null: false
    t.string "summary", null: false
    t.integer "status", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_issues_on_account_id"
    t.index ["project_id"], name: "index_issues_on_project_id"
    t.index ["status"], name: "index_issues_on_status"
    t.index ["work"], name: "index_issues_on_work"
  end

  create_table "issues_events", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.string "action", null: false
    t.string "eventable_type"
    t.bigint "eventable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["eventable_id", "eventable_type"], name: "index_issues_events_on_eventable_id_and_eventable_type"
    t.index ["eventable_type", "eventable_id"], name: "index_issues_events_on_eventable_type_and_eventable_id"
    t.index ["issue_id"], name: "index_issues_events_on_issue_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.string "key", null: false
    t.string "description"
    t.bigint "lead_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key"], name: "index_projects_on_key", unique: true
    t.index ["lead_id"], name: "index_projects_on_lead_id"
    t.index ["name"], name: "index_projects_on_name", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "accounts"
  add_foreign_key "issues", "accounts"
  add_foreign_key "issues", "projects"
  add_foreign_key "issues_events", "issues"

  create_view "project_searches", sql_definition: <<-SQL
      SELECT projects.id,
      projects.name,
      projects.key,
      projects.lead_id,
      accounts.username
     FROM (projects
       JOIN accounts ON ((projects.lead_id = accounts.id)));
  SQL
end
