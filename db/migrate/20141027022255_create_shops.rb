class CreateShops < ActiveRecord::Migration
  def self.up

    #create view sql 
        
  	create_table "shops", primary_key: "shopId", force: true do |t|
    t.string    "shopName",               limit: 100,                                      null: false
    t.string    "shopName_jp",            limit: 300
    t.string    "shopNameFurigana",       limit: 100,                                      null: false
    t.string    "shopAdd",                limit: 300,                                      null: false
    t.string    "shopEmail",              limit: 50,                                       null: false
    t.string    "shopTel",                limit: 50,                                       null: false
    t.string    "shopUrl",                limit: 300,                                      null: false
    t.string    "shopIconExt",            limit: 10,       default: "png",                 null: false
    t.string    "shopImageExt",           limit: 10,       default: "png",                 null: false
    t.string    "shopHeadline",           limit: 300,                                      null: false
    t.string    "shopTestimonials",       limit: 300,                                      null: false
    t.string    "country",                limit: 50,                                       null: false
    t.string    "city",                   limit: 50,                                       null: false
    t.binary    "shopIconBinary",         limit: 16777215
    t.binary    "shopImgBinary",          limit: 16777215
    t.binary    "shopRankIconBinary",     limit: 16777215
    t.integer   "shopRate",                                default: 1
    t.string    "shopStatus",             limit: 5,        default: "1",                   null: false
    t.string    "shopFastCheckinLimit",   limit: 10,       default: "30",                  null: false
    t.time      "shopStartCheck",                          default: '2000-01-01 10:00:00', null: false
    t.integer   "specialCpLimitTime",                      default: 1000000,               null: false
    t.integer   "specialCpLoopLimitTime",                  default: 10
    t.integer   "specialCpId",                                                             null: false
    t.integer   "noticeLimitPerDay",                                                       null: false
    t.string    "noticeTxt",              limit: 300,                                      null: false
    t.integer   "isDeleted",                               default: 0,                     null: false
    t.timestamp "changeDate",                                                              null: false
  end
  	
  end
  def self.down
  	drop_table :shops
  end 
end
