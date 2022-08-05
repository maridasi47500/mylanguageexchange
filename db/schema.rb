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

ActiveRecord::Schema.define(version: 2022_08_05_222642) do

  create_table "bboardcats", force: :cascade do |t|
    t.string "name_fr"
    t.string "name_en"
    t.string "description_fr"
    t.string "description_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "bboards", force: :cascade do |t|
    t.integer "selX3"
    t.integer "selX6"
    t.integer "selCat"
    t.string "txtF1"
    t.text "txaF2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.integer "country_id"
    t.string "name_fr"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string "name_fr"
    t.string "name_en"
    t.integer "no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nationality"
  end

  create_table "emails", force: :cascade do |t|
    t.string "txtSubj"
    t.text "txaBody"
    t.boolean "chkCopySender"
    t.integer "expediteur_id"
    t.integer "UId"
    t.string "lang"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "employers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.string "hidTitle"
    t.string "hidEmpName"
    t.string "hidCity"
    t.integer "hidCountry"
    t.text "hidDescr"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_employers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true
  end

  create_table "hangmancats", force: :cascade do |t|
    t.string "name_fr"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hangmantypes", force: :cascade do |t|
    t.string "name_fr"
    t.string "name_en"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "hangmen", force: :cascade do |t|
    t.string "title"
    t.string "guess"
    t.string "language"
    t.string "types"
    t.string "category"
    t.string "hide"
    t.string "hint1"
    t.string "hint2"
    t.string "hint3"
    t.string "equiv1"
    t.string "equiv2"
    t.string "equiv3"
    t.text "desc"
    t.string "winmsg"
    t.string "losemsg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "member_id"
  end

  create_table "hmancomments", force: :cascade do |t|
    t.text "txaCmts"
    t.integer "MId"
    t.integer "member_id"
  end

  create_table "hmanratings", force: :cascade do |t|
    t.string "txtGuess"
    t.integer "selX3"
    t.integer "radRating"
    t.text "txaFBKComments"
    t.integer "GId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "chkSameX3"
    t.integer "member_id"
  end

  create_table "job_seekers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_job_seekers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_job_seekers_on_reset_password_token", unique: true
  end

  create_table "languages", force: :cascade do |t|
    t.string "name_fr"
    t.string "name_en"
  end

  create_table "learners", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_learners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_learners_on_reset_password_token", unique: true
  end

  create_table "member_native_languages", force: :cascade do |t|
    t.integer "language_id"
    t.integer "member_id"
  end

  create_table "member_practice_languages", force: :cascade do |t|
    t.integer "language_id"
    t.integer "member_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "password_reminder"
    t.text "description"
    t.boolean "by_email"
    t.boolean "text_chat"
    t.boolean "voice_chat"
    t.boolean "in_person"
    t.boolean "teacher"
    t.string "firstname"
    t.string "lastname"
    t.integer "age"
    t.string "city"
    t.integer "country_id"
    t.integer "timezone"
    t.boolean "cgv"
    t.boolean "ads"
    t.boolean "news"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "selGender"
    t.index ["email"], name: "index_members_on_email", unique: true
    t.index ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true
  end

  create_table "notepads", force: :cascade do |t|
    t.integer "lang1"
    t.integer "lang2"
    t.string "txtF1"
    t.string "txtF2"
    t.text "txtF3"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_teachers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_teachers_on_reset_password_token", unique: true
  end

end
