class CreateBeaconShops < ActiveRecord::Migration
  def self.up
    create_table "beacon_shops", primary_key: "recId", force: true do |t|
    t.string    "beaconId",   limit: 100, null: false
    t.string    "shopId",     limit: 100, null: false
    t.string    "property",   limit: 100, null: false
    t.string    "status",     limit: 100, null: false
    t.string    "timeout",    limit: 100, null: false
    t.timestamp "changeDate",             null: false
  end
  add_index "beacon_shops", ["beaconId"], name: "beaconId", using: :btree  
  end
  
  def self.down
  	drop_table :beacon_shops
  end
end
