class AvailableBenefitsView < ActiveRecord::Migration
  #select `tbl_shop_benefits`.`shopId` AS `shopId`,count(0) AS `num`,`tbl_shop_benefits`.`benefit_type` AS `benefit_type` from `tbl_shop_benefits` where (`tbl_shop_benefits`.`valid_to` >= now()) group by 
  #{}`tbl_shop_benefits`.`benefit_type`,`tbl_shop_benefits`.`shopId`;
  def self.up
  	execute <<-SQL
  		CREATE VIEW available_benefits AS
  		SELECT shopId,benefit_type
  		FROM tbl_shop_benefits
  		WHERE valid_to >= now()
  		GROUP BY benefit_type,shopId
	SQL
  end  
  def self.down
  	execute <<-SQL
  		DROP VIEW IF EXISTS available_benefits
  	SQL
  end
end
