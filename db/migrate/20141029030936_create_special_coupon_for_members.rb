class CreateSpecialCouponForMembers < ActiveRecord::Migration
  def self.up
    create_table "special_coupon_for_members", primary_key: "recId", force: true do |t|
    t.integer "benefitId",  null: false
    t.integer "memberId",   null: false
    t.date    "valid_from", null: false
    t.date    "valid_to",   null: false
    t.integer "changeDate", null: false
  end
  end
  def self.down
  	drop_table :special_coupon_for_members
  end
end
