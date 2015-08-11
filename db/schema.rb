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

ActiveRecord::Schema.define(version: 20150810105450) do

  create_table "advocate_offers", force: :cascade do |t|
    t.string   "advocate_offer_type",    limit: 255
    t.datetime "advocate_start_date"
    t.datetime "advocate_end_date"
    t.string   "advocate_min_purchase",  limit: 255
    t.string   "advocate_review_period", limit: 255
    t.string   "referral_code_limit",    limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string   "campaign_name",          limit: 255
    t.string   "campaign_description",   limit: 255
    t.datetime "campaign_start_date"
    t.datetime "campaign_end_date"
    t.string   "advocate_offer_type",    limit: 255
    t.string   "advocate_min_purchase",  limit: 255
    t.string   "advocate_review_period", limit: 255
    t.string   "referral_code_limit",    limit: 255
    t.string   "friend_offer_type",      limit: 255
    t.string   "friend_min_purchase",    limit: 255
    t.boolean  "campaign_status",        limit: 1
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  create_table "codes", force: :cascade do |t|
    t.integer  "customer_id",     limit: 4
    t.string   "redemption_code", limit: 15
    t.datetime "redeemed_on"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "customer_campaigns", force: :cascade do |t|
    t.integer  "customer_id",     limit: 4
    t.integer  "campaign_id",     limit: 4
    t.integer  "no_of_referrals", limit: 4, default: 0
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string   "first_name",      limit: 25
    t.string   "last_name",       limit: 50
    t.string   "email",           limit: 255, default: "", null: false
    t.string   "mobile",          limit: 10
    t.string   "referred_by",     limit: 25
    t.string   "referral_code",   limit: 15
    t.integer  "no_of_referrals", limit: 4,   default: 0
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "friend_offers", force: :cascade do |t|
    t.string   "friend_offer_type",   limit: 255
    t.datetime "friend_start_date"
    t.datetime "friend_end_date"
    t.integer  "friend_min_purchase", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
