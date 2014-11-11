class CreateAvailableBenefitsView < ActiveRecord::Migration
  def self.up
    self.connection.execute %Q(
    	CREATE OR REPLACE VIEW available_benefits AS
    	select `tbl_shop_benefits`.`shopId` AS `shopId`,count(0) AS `num`,`tbl_shop_benefits`.`benefit_type` AS `benefit_type`
    	from `tbl_shop_benefits`
    	where (`tbl_shop_benefits`.`valid_to` >= now()) 
    	group by `tbl_shop_benefits`.`benefit_type`,`tbl_shop_benefits`.`shopId`;
    	)
  end
  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS available_benefits;"
  end
end
