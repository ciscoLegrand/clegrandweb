# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2023_10_22_173012) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_trgm"
  enable_extension "pgcrypto"
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "commands", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tech"
    t.string "command"
    t.string "usage"
    t.integer "level"
    t.uuid "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_commands_on_parent_id"
  end

  create_table "options", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "long"
    t.string "type"
    t.integer "level"
    t.string "usage"
    t.uuid "command_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["command_id"], name: "index_options_on_command_id"
  end

  create_table "translations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "locale"
    t.string "key"
    t.string "value"
    t.uuid "translatable_id", null: false
    t.string "translatable_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["translatable_id"], name: "index_translations_on_translatable_id"
    t.index ["translatable_type", "translatable_id", "key", "locale"], name: "index_translations_on_keys_and_translatable", unique: true
    t.index ["translatable_type"], name: "index_translations_on_translatable_type"
  end

  add_foreign_key "commands", "commands", column: "parent_id"
  add_foreign_key "options", "commands"
end
