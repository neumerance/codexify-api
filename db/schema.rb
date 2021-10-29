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

ActiveRecord::Schema.define(version: 2021_10_29_191347) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "verses", force: :cascade do |t|
    t.string "book_name"
    t.integer "chapter_id"
    t.integer "verse_id"
    t.string "translation_code"
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["translation_code", "book_name", "chapter_id", "verse_id"], name: "bible_verse_search_index", unique: true
  end

end
