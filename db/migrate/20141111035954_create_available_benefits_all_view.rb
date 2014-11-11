class CreateAvailableBenefitsAllView < ActiveRecord::Migration

  def self.up
    self.connection.execute %Q(
    	CREATE OR REPLACE VIEW available_benefits_all AS
    	select `tbl_shop_benefits`.`benefitId` AS `benefitId`,
    	`tbl_shop_benefits`.`shopId` AS `shopId`,
    	`tbl_shop_benefits`.`title` AS `title`,
    	`tbl_shop_benefits`.`text` AS `text`,
    	`tbl_shop_benefits`.`image` AS `image`,
    	`tbl_shop_benefits`.`valid_from` AS `valid_from`,
    	`tbl_shop_benefits`.`valid_to` AS `valid_to`,
    	`tbl_shop_benefits`.`target_sex` AS `target_sex`,
    	`tbl_shop_benefits`.`target_age` AS `target_age`,
    	`tbl_shop_benefits`.`target_rank` AS `target_rank`,
    	`tbl_shop_benefits`.`benefit_type` AS `benefit_type`
    	from `tbl_shop_benefits`
    	where (`tbl_shop_benefits`.`valid_to` >= now());
    	)
  end

  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS available_benefits_all;"
  end
  
end
