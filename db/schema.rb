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

ActiveRecord::Schema.define(version: 20141027075059) do

  create_table "beacons", primary_key: "beaconId", force: true do |t|
    t.string   "manufacture",    limit: 100
    t.string   "beaconUniqueId", limit: 100, null: false
    t.string   "majorCode",      limit: 100, null: false
    t.string   "minorCode",      limit: 100, null: false
    t.string   "beaconTxt",      limit: 200
    t.datetime "changeDate",                 null: false
  end

  add_index "beacons", ["beaconUniqueId", "majorCode", "minorCode"], name: "beaconUniqueId", unique: true, using: :btree

  create_table "devices", primary_key: "recordId", force: true do |t|
    t.string   "deviceId",                  limit: 100,               null: false
    t.string   "memberId",                  limit: 100,               null: false
    t.string   "deviceType",                limit: 100,               null: false
    t.string   "status",                    limit: 100, default: "1", null: false
    t.text     "gcmRegId"
    t.text     "apnToken"
    t.string   "noticeTypeAtShopCoupon",    limit: 50,                null: false
    t.string   "noticeTypeAroundCoupon",    limit: 50,                null: false
    t.string   "noticeTypeAtShopNews",      limit: 50,                null: false
    t.string   "noticeTypeAroundNews",      limit: 50,                null: false
    t.string   "noticeTypeAtFixedInterval", limit: 50,                null: false
    t.time     "noticeTime"
    t.string   "areadySendBenefitId",       limit: 400,               null: false
    t.datetime "updateDate",                                          null: false
  end

  add_index "devices", ["deviceId"], name: "deviceId", using: :btree

  create_table "shop", primary_key: "shopId", force: true do |t|
    t.string    "shopName",               limit: 100,                                      null: false
    t.string    "shopName_jp",            limit: 300
    t.string    "shopNameFurigana",       limit: 100,                                      null: false
    t.string    "shopAdd",                limit: 300,                                      null: false
    t.string    "shopEmail",              limit: 50,                                       null: false
    t.string    "shopTel",                limit: 50,                                       null: false
    t.string    "shopUrl",                limit: 300,                                      null: false
    t.string    "shopIconExt",            limit: 10,       default: "png",                 null: false
    t.string    "shopImageExt",           limit: 10,       default: "png",                 null: false
    t.string    "shopHeadline",           limit: 300,                                      null: false
    t.string    "shopTestimonials",       limit: 300,                                      null: false
    t.string    "country",                limit: 50,                                       null: false
    t.string    "city",                   limit: 50,                                       null: false
    t.binary    "shopIconBinary",         limit: 16777215
    t.binary    "shopImgBinary",          limit: 16777215
    t.binary    "shopRankIconBinary",     limit: 16777215
    t.integer   "shopRate",                                default: 1
    t.string    "shopStatus",             limit: 5,        default: "1",                   null: false
    t.string    "shopFastCheckinLimit",   limit: 10,       default: "30",                  null: false
    t.time      "shopStartCheck",                          default: '2000-01-01 10:00:00', null: false
    t.integer   "specialCpLimitTime",                      default: 1000000,               null: false
    t.integer   "specialCpLoopLimitTime",                  default: 10
    t.integer   "specialCpId",                                                             null: false
    t.integer   "noticeLimitPerDay",                                                       null: false
    t.string    "noticeTxt",              limit: 300,                                      null: false
    t.integer   "isDeleted",                               default: 0,                     null: false
    t.timestamp "changeDate",                                                              null: false
  end

  create_table "shop_members", force: true do |t|
    t.string   "staff_name"
    t.string   "staff_email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "staff_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", primary_key: "shopId", force: true do |t|
    t.string   "shopName",               limit: 100,                                      null: false
    t.string   "shopName_jp",            limit: 300
    t.string   "shopNameFurigana",       limit: 100,                                      null: false
    t.string   "shopAdd",                limit: 300,                                      null: false
    t.string   "shopEmail",              limit: 50,                                       null: false
    t.string   "shopTel",                limit: 50,                                       null: false
    t.string   "shopUrl",                limit: 300,                                      null: false
    t.string   "shopIconExt",            limit: 10,       default: "png",                 null: false
    t.string   "shopImageExt",           limit: 10,       default: "png",                 null: false
    t.string   "shopHeadline",           limit: 300,                                      null: false
    t.string   "shopTestimonials",       limit: 300,                                      null: false
    t.string   "country",                limit: 50,                                       null: false
    t.string   "city",                   limit: 50,                                       null: false
    t.binary   "shopIconBinary",         limit: 16777215
    t.binary   "shopImgBinary",          limit: 16777215
    t.binary   "shopRankIconBinary",     limit: 16777215
    t.integer  "shopRate",                                default: 1
    t.string   "shopStatus",             limit: 5,        default: "1",                   null: false
    t.string   "shopFastCheckinLimit",   limit: 10,       default: "30",                  null: false
    t.time     "shopStartCheck",                          default: '2000-01-01 10:00:00', null: false
    t.integer  "specialCpLimitTime",                      default: 1000000,               null: false
    t.integer  "specialCpLoopLimitTime",                  default: 10
    t.integer  "specialCpId",                                                             null: false
    t.integer  "noticeLimitPerDay",                                                       null: false
    t.string   "noticeTxt",              limit: 300,                                      null: false
    t.integer  "isDeleted",                               default: 0,                     null: false
    t.datetime "changeDate",                                                              null: false
  end

end
