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

ActiveRecord::Schema[7.0].define(version: 2023_07_11_211209) do
  create_table "agents", force: :cascade do |t|
    t.string "fullname"
    t.string "dob"
    t.string "gender"
    t.string "phonenumber"
    t.string "emailaddress"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "workhistory"
    t.string "certifications"
    t.string "education"
    t.string "marketingexperience"
    t.string "onlinemarketing"
    t.string "socialmediapromotion"
    t.string "communicationskills"
    t.string "interpersonalskills"
    t.string "marketingknowledge"
    t.string "technologyskills"
    t.string "workinghours"
    t.string "additionalcomments"
    t.string "agreement"
    t.integer "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_agents_on_landlord_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "composes", force: :cascade do |t|
    t.string "email"
    t.string "cc"
    t.string "bcc"
    t.string "subject"
    t.string "message"
    t.string "attachments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drafts", force: :cascade do |t|
    t.string "email"
    t.string "cc"
    t.string "bcc"
    t.string "subject"
    t.string "message"
    t.string "attachments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inboxs", force: :cascade do |t|
    t.string "email"
    t.string "cc"
    t.string "bcc"
    t.string "subject"
    t.string "message"
    t.string "attachments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "landlords", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.string "listingType"
    t.string "town"
    t.string "name"
    t.string "listingStatus"
    t.string "priceFrom"
    t.string "priceUpTo"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.json "images", default: []
    t.integer "landlord_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_listings_on_landlord_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.string "item"
    t.string "details"
    t.json "images", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "managers", force: :cascade do |t|
    t.string "fullname"
    t.string "dob"
    t.integer "idnumber"
    t.string "phonenumber"
    t.string "emailaddress"
    t.string "nssfnumber"
    t.string "nhifnumber"
    t.string "krapin"
    t.string "propertyname"
    t.json "idimage", default: []
    t.integer "landlord_id"
    t.integer "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_managers_on_landlord_id"
    t.index ["listing_id"], name: "index_managers_on_listing_id"
  end

  create_table "tenants", force: :cascade do |t|
    t.string "fullname"
    t.date "dob"
    t.string "gender"
    t.string "Krapin"
    t.string "nationality"
    t.string "phonenumber"
    t.string "emailaddress"
    t.string "currentaddress"
    t.string "emergencycontact"
    t.string "idtype"
    t.string "idnumber"
    t.string "idexpirydate"
    t.json "idattachment", default: []
    t.string "employer"
    t.string "jobtitle"
    t.string "monthlyincome"
    t.string "personalreference"
    t.string "previouslandlord"
    t.date "leasestartdate"
    t.date "leaseenddate"
    t.string "rentamount"
    t.string "securitydeposit"
    t.string "additionalnotes"
    t.string "propertyname"
    t.integer "landlord_id"
    t.integer "listing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["landlord_id"], name: "index_tenants_on_landlord_id"
    t.index ["listing_id"], name: "index_tenants_on_listing_id"
  end

  add_foreign_key "agents", "landlords"
  add_foreign_key "listings", "landlords"
  add_foreign_key "managers", "landlords"
  add_foreign_key "managers", "listings"
  add_foreign_key "tenants", "landlords"
  add_foreign_key "tenants", "listings"
end
