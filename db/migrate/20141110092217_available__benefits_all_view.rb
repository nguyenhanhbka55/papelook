class AvailableBenefitsAllView < ActiveRecord::Migration
  def self.up
  	execute <<-SQL
  		CREATE VIEW available_benefits_all AS
  		SELECT `text`,benefitId,shopId,title,image,valid_from,valid_to,target_sex,target_age,target_rank,benefit_type  		
  		FROM tbl_shop_benefits
  		WHERE valid_to >= now()
  	SQL
  end
  def self.down
  	execute <<-SQL
  		DROP VIEW IF EXISTS available_benefits_all
  	SQL
  end  
end
