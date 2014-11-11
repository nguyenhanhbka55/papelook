class CreateDevices < ActiveRecord::Migration
  def self.up
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
  end
  def self.down
  	drop_table :devices
  end
end
