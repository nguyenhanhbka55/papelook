class CreateCheckinpermembyshopmonths < ActiveRecord::Migration
  def self.up
    create_table "checkinpermembyshopmonths", id: false, force: true do |t|
    t.string  "deviceId",                  limit: 100
    t.string  "beaconId",                  limit: 100
    t.string  "shopId",                    limit: 50
    t.string  "memberId",                  limit: 100
    t.integer "countPerDeviceMonthByShop", limit: 8
  end
  end
  def self.down
  	drop_table :checkinpermembyshopmonths
  end
end
