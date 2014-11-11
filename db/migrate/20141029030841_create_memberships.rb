class CreateMemberships < ActiveRecord::Migration
  def self.up
    create_table "memberships", primary_key: "recId", force: true do |t|
    t.string    "memberId",            limit: 100,             null: false
    t.string    "shopId",              limit: 100,             null: false
    t.datetime  "jointDate",                                   null: false
    t.string    "memberRank",          limit: 100,             null: false
    t.string    "memberNote",          limit: 300,             null: false
    t.string    "memberFavorite",      limit: 300,             null: false
    t.string    "memberDislike",       limit: 300,             null: false
    t.string    "memberOther",         limit: 300,             null: false
    t.string    "memberConsideration", limit: 300
    t.string    "member_watch",        limit: 10,              null: false
    t.integer   "memberShowPoint",                 default: 1, null: false
    t.integer   "memberCheckinPoint",  limit: 8,   default: 0, null: false
    t.timestamp "changeDate",                                  null: false
  end

  add_index "memberships", ["memberId"], name: "memberId", using: :btree
  add_index "memberships", ["shopId"], name: "shopId", using: :btree    
  end
  def self.down
  	drop_table :memberships
  end
end
