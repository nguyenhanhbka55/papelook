class CreateCheckinInfoAlls < ActiveRecord::Migration
  def self.up
    create_table "checkin_info_alls", id: false, force: true do |t|
    t.integer "shopId"
    t.string  "shopName",             limit: 100
    t.string  "shopNameFurigana",     limit: 100
    t.string  "shopAdd",              limit: 300
    t.string  "shopEmail",            limit: 50
    t.string  "shopTel",              limit: 50
    t.string  "shopUrl",              limit: 300
    t.string  "shopIconExt",          limit: 10
    t.string  "shopImageExt",         limit: 10
    t.string  "shopHeadline",         limit: 300
    t.string  "shopTestimonials",     limit: 300
    t.string  "country",              limit: 50
    t.string  "city",                 limit: 50
    t.binary  "shopIconBinary",       limit: 16777215
    t.binary  "shopImgBinary",        limit: 16777215
    t.binary  "shopRankIconBinary",   limit: 16777215
    t.integer "shopRate"
    t.string  "shopStatus",           limit: 5
    t.string  "shopFastCheckinLimit", limit: 10
    t.time    "shopStartCheck"
    t.integer "totalPerShopMonth",    limit: 8
    t.integer "totalPerShop",         limit: 8
    t.string  "memberId",             limit: 100
    t.string  "memberRank",           limit: 100
    t.integer "memberCheckinPoint",   limit: 8
    t.string  "deviceId",             limit: 100
  end
  end
  def self.down
  	drop_table :checkin_info_alls
  end
end
