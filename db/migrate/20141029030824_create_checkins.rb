class CreateCheckins < ActiveRecord::Migration
  def self.up
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

  end
  def self.down
  	drop_table :checkins
  end
end
