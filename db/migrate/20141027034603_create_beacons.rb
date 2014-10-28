class CreateBeacons < ActiveRecord::Migration
  def self.up
  	create_table "beacons", primary_key: "beaconId", force: true do |t|
    t.string    "manufacture",    limit: 100
    t.string    "beaconUniqueId", limit: 100, null: false
    t.string    "majorCode",      limit: 100, null: false
    t.string    "minorCode",      limit: 100, null: false
    t.string    "beaconTxt",      limit: 200
    t.timestamp "changeDate",                 null: false
  end

  add_index "beacons", ["beaconUniqueId", "majorCode", "minorCode"], name: "beaconUniqueId", unique: true, using: :btree
  end
  def self.down
  	drop_table :beacons
  end
end
