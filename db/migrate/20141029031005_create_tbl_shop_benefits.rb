class CreateTblShopBenefits < ActiveRecord::Migration
  def self.up
    create_table "tbl_shop_benefits", primary_key: "benefitId", force: true do |t|
    t.string    "shopId",       limit: 100,                         null: false
    t.string    "title",        limit: 100,                         null: false
    t.string    "text",         limit: 300,                         null: false
    t.string    "noticeTxt",    limit: 300
    t.binary    "image",        limit: 16777215,                    null: false
    t.date      "valid_from",                                       null: false
    t.date      "valid_to",                                         null: false
    t.string    "target_sex",   limit: 100,      default: "all",    null: false
    t.string    "target_age",   limit: 100,      default: "all",    null: false
    t.string    "target_rank",  limit: 100,      default: "all",    null: false
    t.string    "benefit_type", limit: 100,      default: "coupon"
    t.timestamp "createTime",                                       null: false
    t.integer   "limitTime",                     default: 10,       null: false
    t.timestamp "changeDate",                                       null: false
  end
  end
  def self.down
  	drop_table :tbl_shop_benefits
  end
end
