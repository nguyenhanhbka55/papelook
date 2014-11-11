class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table "members", primary_key: "memberId", force: true do |t|
    t.string    "memberName",         limit: 100
    t.string    "memberNameFurikana", limit: 100
    t.date      "memberDoB"
    t.string    "memberPostalcode",   limit: 100
    t.string    "memberAdd",          limit: 300
    t.string    "memberTel",          limit: 50
    t.string    "memberSex",          limit: 100
    t.string    "memberEmail",        limit: 50,                 null: false
    t.string    "memberPassword",     limit: 200,                null: false
    t.string    "memberLanguage",     limit: 10,  default: "en", null: false
    t.string    "memberStatus",       limit: 50,  default: "1",  null: false
    t.timestamp "changeDate",                                    null: false
  end

  add_index "members", ["memberEmail"], name: "memberEmail", using: :btree
  end
  def self.down
  	drop_table :members
  end
end
