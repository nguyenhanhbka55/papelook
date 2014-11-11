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

ActiveRecord::Schema.define(version: 20141111030527) do

  create_table "available_benefits", id: false, force: true do |t|
    t.string "shopId",       limit: 100,                    null: false
    t.string "benefit_type", limit: 100, default: "coupon"
  end

  create_table "available_benefits_all", id: false, force: true do |t|
    t.string  "text",         limit: 300,                         null: false
    t.integer "benefitId",                     default: 0,        null: false
    t.string  "shopId",       limit: 100,                         null: false
    t.string  "title",        limit: 100,                         null: false
    t.binary  "image",        limit: 16777215,                    null: false
    t.date    "valid_from",                                       null: false
    t.date    "valid_to",                                         null: false
    t.string  "target_sex",   limit: 100,      default: "all",    null: false
    t.string  "target_age",   limit: 100,      default: "all",    null: false
    t.string  "target_rank",  limit: 100,      default: "all",    null: false
    t.string  "benefit_type", limit: 100,      default: "coupon"
  end

  create_table "available_benefits_views", force: true do |t|
  end

  create_table "beacon_shops", primary_key: "recId", force: true do |t|
    t.string   "beaconId",   limit: 100, null: false
    t.string   "shopId",     limit: 100, null: false
    t.string   "property",   limit: 100, null: false
    t.string   "status",     limit: 100, null: false
    t.string   "timeout",    limit: 100, null: false
    t.datetime "changeDate",             null: false
  end

  add_index "beacon_shops", ["beaconId"], name: "beaconId", using: :btree

  create_table "beaconinfo", id: false, force: true do |t|
    t.integer "beaconId",                   default: 0, null: false
    t.string  "shopId",         limit: 100,             null: false
    t.string  "beaconUniqueId", limit: 100,             null: false
    t.string  "majorCode",      limit: 100,             null: false
    t.string  "minorCode",      limit: 100,             null: false
    t.string  "property",       limit: 100,             null: false
    t.string  "status",         limit: 100,             null: false
    t.string  "beaconTxt",      limit: 200
    t.string  "timeout",        limit: 100,             null: false
    t.string  "manufacture",    limit: 100
  end

  create_table "beacons", primary_key: "beaconId", force: true do |t|
    t.string   "manufacture",    limit: 100
    t.string   "beaconUniqueId", limit: 100, null: false
    t.string   "majorCode",      limit: 100, null: false
    t.string   "minorCode",      limit: 100, null: false
    t.string   "beaconTxt",      limit: 200
    t.datetime "changeDate",                 null: false
  end

  add_index "beacons", ["beaconUniqueId", "majorCode", "minorCode"], name: "beaconUniqueId", unique: true, using: :btree

  create_table "checkininfo", id: false, force: true do |t|
    t.string   "deviceId",                  limit: 100
    t.string   "beaconId",                  limit: 100
    t.string   "shopId",                    limit: 50
    t.string   "memberId",                  limit: 100
    t.integer  "countPerDeviceByShop",      limit: 8
    t.datetime "lastCheckinTime"
    t.datetime "nowCheckinTime"
    t.integer  "countPerDeviceMonthByShop", limit: 8,   default: 0, null: false
  end

  create_table "checkininfodetail", id: false, force: true do |t|
    t.string   "deviceId",                  limit: 100
    t.string   "beaconId",                  limit: 100
    t.string   "memberId",                  limit: 100
    t.integer  "countPerDeviceByShop",      limit: 8
    t.datetime "lastCheckinTime"
    t.datetime "nowCheckinTime"
    t.integer  "countPerDeviceMonthByShop", limit: 8
    t.string   "couponGet",                 limit: 100, null: false
  end

  create_table "checkininfos", id: false, force: true do |t|
    t.string   "deviceId",                  limit: 100
    t.string   "beaconId",                  limit: 100
    t.string   "shopId",                    limit: 50
    t.string   "memberId",                  limit: 100
    t.integer  "countPerDeviceByShop",      limit: 8
    t.datetime "lastCheckinTime"
    t.datetime "nowCheckinTime"
    t.integer  "countPerDeviceMonthByShop", limit: 8
  end

  create_table "checkinpermembyshop", id: false, force: true do |t|
    t.string   "deviceId",             limit: 100,             null: false
    t.string   "beaconId",             limit: 100,             null: false
    t.string   "shopId",               limit: 50,              null: false
    t.string   "memberId",             limit: 100,             null: false
    t.integer  "countPerDeviceByShop", limit: 8,   default: 0, null: false
    t.datetime "lastCheckinTime"
    t.datetime "nowCheckinTime"
  end

  create_table "checkinpermembyshopmonths", id: false, force: true do |t|
    t.string  "deviceId",                  limit: 100
    t.string  "beaconId",                  limit: 100
    t.string  "shopId",                    limit: 50
    t.string  "memberId",                  limit: 100
    t.integer "countPerDeviceMonthByShop", limit: 8
  end

  create_table "checkinpermembyshops", id: false, force: true do |t|
    t.string   "deviceId",             limit: 100
    t.string   "beaconId",             limit: 100
    t.string   "shopId",               limit: 50
    t.string   "memberId",             limit: 100
    t.integer  "countPerDeviceByShop", limit: 8
    t.datetime "lastCheckinTime"
    t.datetime "nowCheckinTime"
  end

  create_table "checkins", primary_key: "checkinId", force: true do |t|
    t.string   "deviceId",              limit: 100, null: false
    t.string   "beaconId",              limit: 100, null: false
    t.string   "shopId",                limit: 50,  null: false
    t.string   "memberId",              limit: 100, null: false
    t.datetime "checkinTime",                       null: false
    t.datetime "lastCheckinTime",                   null: false
    t.string   "couponGet",             limit: 100, null: false
    t.string   "checkoutTime",          limit: 100, null: false
    t.string   "checkinTxt",            limit: 200
    t.integer  "is_first_checkin_aday",             null: false
  end

  add_index "checkins", ["beaconId"], name: "beaconId", using: :btree
  add_index "checkins", ["checkinTime"], name: "checkinTime", using: :btree
  add_index "checkins", ["deviceId"], name: "deviceId", using: :btree
  add_index "checkins", ["memberId"], name: "memberId", using: :btree

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

  create_table "lang_guis", force: true do |t|
    t.string    "key_txt",    limit: 100,  null: false
    t.string    "en",         limit: 1000, null: false
    t.string    "jp",         limit: 1000, null: false
    t.string    "controller", limit: 100,  null: false
    t.timestamp "changeDate",              null: false
  end

  add_index "lang_guis", ["key_txt", "controller"], name: "key_txt", unique: true, using: :btree

  create_table "members", primary_key: "memberId", force: true do |t|
    t.string   "memberName",         limit: 100
    t.string   "memberNameFurikana", limit: 100
    t.date     "memberDoB"
    t.string   "memberPostalcode",   limit: 100
    t.string   "memberAdd",          limit: 300
    t.string   "memberTel",          limit: 50
    t.string   "memberSex",          limit: 100
    t.string   "memberEmail",        limit: 50,                 null: false
    t.string   "memberPassword",     limit: 200,                null: false
    t.string   "memberLanguage",     limit: 10,  default: "en", null: false
    t.string   "memberStatus",       limit: 50,  default: "1",  null: false
    t.datetime "changeDate",                                    null: false
  end

  add_index "members", ["memberEmail"], name: "memberEmail", using: :btree

  create_table "memberships", primary_key: "recId", force: true do |t|
    t.string   "memberId",            limit: 100,             null: false
    t.string   "shopId",              limit: 100,             null: false
    t.datetime "jointDate",                                   null: false
    t.string   "memberRank",          limit: 100,             null: false
    t.string   "memberNote",          limit: 300,             null: false
    t.string   "memberFavorite",      limit: 300,             null: false
    t.string   "memberDislike",       limit: 300,             null: false
    t.string   "memberOther",         limit: 300,             null: false
    t.string   "memberConsideration", limit: 300
    t.string   "member_watch",        limit: 10,              null: false
    t.integer  "memberShowPoint",                 default: 1, null: false
    t.integer  "memberCheckinPoint",  limit: 8,   default: 0, null: false
    t.datetime "changeDate",                                  null: false
  end

  add_index "memberships", ["memberId"], name: "memberId", using: :btree
  add_index "memberships", ["shopId"], name: "shopId", using: :btree

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

  create_table "special_coupon_for_members", primary_key: "recId", force: true do |t|
    t.integer "benefitId",  null: false
    t.integer "memberId",   null: false
    t.date    "valid_from", null: false
    t.date    "valid_to",   null: false
    t.integer "changeDate", null: false
  end

  create_table "tbl_mem_ranks", primary_key: "rankId", force: true do |t|
    t.integer  "rankLimit",  limit: 8,  null: false
    t.string   "rankTxt",    limit: 50, null: false
    t.integer  "shopId",                null: false
    t.datetime "changeDate",            null: false
  end

  create_table "tbl_shop_benefits", primary_key: "benefitId", force: true do |t|
    t.string   "shopId",       limit: 100,                         null: false
    t.string   "title",        limit: 100,                         null: false
    t.string   "text",         limit: 300,                         null: false
    t.string   "noticeTxt",    limit: 300
    t.binary   "image",        limit: 16777215,                    null: false
    t.date     "valid_from",                                       null: false
    t.date     "valid_to",                                         null: false
    t.string   "target_sex",   limit: 100,      default: "all",    null: false
    t.string   "target_age",   limit: 100,      default: "all",    null: false
    t.string   "target_rank",  limit: 100,      default: "all",    null: false
    t.string   "benefit_type", limit: 100,      default: "coupon"
    t.datetime "createTime",                                       null: false
    t.integer  "limitTime",                     default: 10,       null: false
    t.datetime "changeDate",                                       null: false
  end

end
