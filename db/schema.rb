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

ActiveRecord::Schema.define(version: 20140926143929) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "parts", force: true do |t|
    t.string   "name"
    t.text     "value"
    t.integer  "user_id"
    t.integer  "component_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.string   "button_status"
  end

  add_index "parts", ["component_id"], name: "index_parts_on_component_id", using: :btree
  add_index "parts", ["user_id"], name: "index_parts_on_user_id", using: :btree

end
