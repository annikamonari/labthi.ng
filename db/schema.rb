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

ActiveRecord::Schema.define(version: 20141108185419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "admin_tasks", force: true do |t|
    t.integer  "admin_id"
    t.integer  "part_id"
    t.string   "title"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "answers", force: true do |t|
    t.text     "brief"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "question_id"
  end

  create_table "aspects", force: true do |t|
    t.text     "brief"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "badges_sashes", force: true do |t|
    t.integer  "badge_id"
    t.integer  "sash_id"
    t.boolean  "notified_user", default: false
    t.datetime "created_at"
  end

  add_index "badges_sashes", ["badge_id", "sash_id"], name: "index_badges_sashes_on_badge_id_and_sash_id", using: :btree
  add_index "badges_sashes", ["badge_id"], name: "index_badges_sashes_on_badge_id", using: :btree
  add_index "badges_sashes", ["sash_id"], name: "index_badges_sashes_on_sash_id", using: :btree

  create_table "bootsy_image_galleries", force: true do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: true do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "buy_phase_votes", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.boolean  "buy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "brief"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  create_table "components", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.integer  "idea_build_id"
  end

  add_index "components", ["idea_build_id"], name: "index_components_on_idea_build_id", using: :btree

  create_table "idea_builds", force: true do |t|
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_builds", ["idea_id"], name: "index_idea_builds_on_idea_id", using: :btree

  create_table "idea_relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_relationships", ["followed_id"], name: "index_idea_relationships_on_followed_id", using: :btree
  add_index "idea_relationships", ["follower_id", "followed_id"], name: "index_idea_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "idea_relationships", ["follower_id"], name: "index_idea_relationships_on_follower_id", using: :btree

  create_table "ideas", force: true do |t|
    t.integer  "phase"
    t.text     "brief"
    t.string   "image"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "title"
  end

  create_table "lab_evaluations", force: true do |t|
    t.integer  "evaluator_id"
    t.integer  "content_creator_id"
    t.integer  "content_id"
    t.string   "content_type"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "lab_evaluations", ["content_creator_id"], name: "index_lab_evaluations_on_content_creator_id", using: :btree
  add_index "lab_evaluations", ["content_id", "content_type"], name: "index_lab_evaluations_on_content_id_and_content_type", using: :btree
  add_index "lab_evaluations", ["evaluator_id"], name: "index_lab_evaluations_on_evaluator_id", using: :btree

  create_table "part_uploads", force: true do |t|
    t.integer  "part_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parts", force: true do |t|
    t.string   "name"
    t.text     "value"
    t.integer  "user_id"
    t.integer  "component_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "equity"
  end

  add_index "parts", ["component_id"], name: "index_parts_on_component_id", using: :btree
  add_index "parts", ["user_id"], name: "index_parts_on_user_id", using: :btree

  create_table "profiles", force: true do |t|
    t.integer  "user_id"
    t.string   "website"
    t.integer  "age"
    t.string   "profession"
    t.string   "country"
    t.text     "about"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "questions", force: true do |t|
    t.text     "title"
    t.text     "brief"
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["idea_id"], name: "index_questions_on_idea_id", using: :btree
  add_index "questions", ["user_id"], name: "index_questions_on_user_id", using: :btree

  create_table "rails_admin_histories", force: true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      limit: 2
    t.integer  "year",       limit: 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], name: "index_rails_admin_histories", using: :btree

  create_table "sashes", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", force: true do |t|
    t.text     "brief"
    t.integer  "aspect_id"
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "solutions", ["aspect_id"], name: "index_solutions_on_aspect_id", using: :btree
  add_index "solutions", ["idea_id"], name: "index_solutions_on_idea_id", using: :btree
  add_index "solutions", ["user_id"], name: "index_solutions_on_user_id", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  create_table "task_comments", force: true do |t|
    t.integer  "admin_task_id"
    t.integer  "user_id"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "sash_id"
    t.integer  "level",                  default: 0
    t.integer  "points",                 default: 0
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "answers", "questions", name: "solutions_question_id_fk"
  add_foreign_key "answers", "users", name: "solutions_user_id_fk"

  add_foreign_key "comments", "users", name: "comments_user_id_fk"

  add_foreign_key "ideas", "users", name: "ideas_user_id_fk"

  add_foreign_key "profiles", "users", name: "profiles_user_id_fk"

  add_foreign_key "questions", "ideas", name: "questions_idea_id_fk"
  add_foreign_key "questions", "users", name: "questions_user_id_fk"

  add_foreign_key "taggings", "tags", name: "taggings_tag_id_fk"

end
