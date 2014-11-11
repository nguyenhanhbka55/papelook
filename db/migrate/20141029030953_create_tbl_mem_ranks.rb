class CreateTblMemRanks < ActiveRecord::Migration
  def self.up
    create_table "tbl_mem_ranks", primary_key: "rankId", force: true do |t|
    t.integer   "rankLimit",  limit: 8,  null: false
    t.string    "rankTxt",    limit: 50, null: false
    t.integer   "shopId",                null: false
    t.timestamp "changeDate",            null: false
  end
  end
  def self.down
  	drop_table :tbl_mem_ranks
  end
end
