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

ActiveRecord::Schema.define(version: 20150423014453) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fallacies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug",       null: false
  end

  add_index "fallacies", ["slug"], name: "index_fallacies_on_slug", using: :btree

  create_table "fallacy_translations", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "fallacy_id",  null: false
    t.string   "locale",      null: false
    t.string   "name",        null: false
    t.text     "description"
  end

  add_index "fallacy_translations", ["fallacy_id"], name: "index_fallacy_translations_on_fallacy_id", using: :btree
  add_index "fallacy_translations", ["locale"], name: "index_fallacy_translations_on_locale", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "statement_translations", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "statement_id", null: false
    t.string   "locale",       null: false
    t.text     "description"
  end

  add_index "statement_translations", ["locale"], name: "index_statement_translations_on_locale", using: :btree
  add_index "statement_translations", ["statement_id"], name: "index_statement_translations_on_statement_id", using: :btree

  create_table "statements", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "fallacy_id", null: false
  end

  add_index "statements", ["fallacy_id"], name: "index_statements_on_fallacy_id", using: :btree

  add_foreign_key "statements", "fallacies"
end