class CreateCheckinpermembyshops < ActiveRecord::Migration
  def self.up
   create_table "checkinpermembyshops", id: false, force: true do |t|
    t.string   "deviceId",             limit: 100
    t.string   "beaconId",             limit: 100
    t.string   "shopId",               limit: 50
    t.string   "memberId",             limit: 100
    t.integer  "countPerDeviceByShop", limit: 8
    t.datetime "lastCheckinTime"
    t.datetime "nowCheckinTime"
  end
  end
  def self.down
  	drop_table :checkinpermembyshops
  end
end
