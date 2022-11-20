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

ActiveRecord::Schema[7.0].define(version: 2022_11_20_221359) do
  create_table "api_keys", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "access_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.integer "chat_no"
    t.integer "msg_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "chats", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "noOfChat"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "applications_id", null: false
    t.index ["applications_id"], name: "index_chats_on_applications_id"
  end

  create_table "messages", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "msg_number"
    t.text "text"
    t.bigint "applications_id", null: false
    t.bigint "chats_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["applications_id"], name: "index_messages_on_applications_id"
    t.index ["chats_id"], name: "index_messages_on_chats_id"
  end

  add_foreign_key "chats", "applications", column: "applications_id"
  add_foreign_key "messages", "applications", column: "applications_id"
  add_foreign_key "messages", "chats", column: "chats_id"
end
