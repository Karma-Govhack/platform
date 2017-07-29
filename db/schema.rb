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

ActiveRecord::Schema.define(version: 20170729213655) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "Charity", force: :cascade do |t|
    t.string  "name"
    t.string  "address"
    t.integer "Sector_id"
    t.decimal "latitude"
    t.decimal "longtitude"
    t.index ["Sector_id"], name: "index_Charity_on_Sector_id", using: :btree
  end

  create_table "Job", force: :cascade do |t|
    t.string  "name"
    t.string  "description"
    t.decimal "hours"
    t.integer "amount_workers"
    t.decimal "latitude"
    t.decimal "longtitude"
    t.integer "Charity_id"
    t.index ["Charity_id"], name: "index_Job_on_Charity_id", using: :btree
  end

  create_table "JobsAndSkills", force: :cascade do |t|
    t.integer "Skill_id"
    t.integer "Job_id"
  end

  create_table "Sector", force: :cascade do |t|
    t.string "name"
  end

  create_table "SectorAndVolunteer", force: :cascade do |t|
    t.integer "Volunteer_id"
    t.integer "Sector_id"
  end

  create_table "Skills", force: :cascade do |t|
    t.string "name"
  end

  create_table "Volunteer", force: :cascade do |t|
    t.string  "first_name"
    t.string  "last_name"
    t.decimal "latitude"
    t.decimal "longtitude"
    t.text    "note"
    t.decimal "hours"
    t.string  "phone"
    t.string  "email"
  end

  create_table "VolunteerAndSkills", force: :cascade do |t|
    t.integer "Volunteer_id"
    t.integer "Skill_id"
  end

  add_foreign_key "JobsAndSkills", "\"Job\"", column: "Job_id"
  add_foreign_key "JobsAndSkills", "\"Skills\"", column: "Skill_id"
  add_foreign_key "SectorAndVolunteer", "\"Sector\"", column: "Sector_id"
  add_foreign_key "SectorAndVolunteer", "\"Volunteer\"", column: "Volunteer_id"
  add_foreign_key "VolunteerAndSkills", "\"Skills\"", column: "Skill_id"
  add_foreign_key "VolunteerAndSkills", "\"Volunteer\"", column: "Volunteer_id"
end
