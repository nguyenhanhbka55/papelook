class CreateMembershipinfoView < ActiveRecord::Migration
  def self.up
    self.connection.execute %Q(
    	CREATE OR REPLACE VIEW membershipinfo AS
    	select `m`.`memberId` AS `memberId`,
    		`mb`.`shopId` AS `shopId`,
    		`m`.`memberStatus` AS `memberStatus`,
    		`m`.`memberName` AS `memberName`,
    		`m`.`memberNameFurikana` AS `memberNameFurikana`,
    		`m`.`memberDoB` AS `memberDoB`,
    		`m`.`memberAdd` AS `memberAdd`,
    		`m`.`memberTel` AS `memberTel`,
    		`m`.`memberSex` AS `memberSex`,
    		`m`.`memberEmail` AS `memberEmail`,
    		`m`.`memberPassword` AS `memberPassword`,
    		`m`.`memberLanguage` AS `memberLanguage`,
    		`mb`.`memberRank` AS `memberRank`,`mb`.`jointDate` AS `jointDate`,`mb`.`memberNote` AS `memberNote`,`mb`.`memberFavorite` AS `memberFavorite`,`mb`.`memberDislike` AS `memberDislike`,`mb`.`memberOther` AS `memberOther`,`mb`.`member_watch` AS `member_watch`,`mb`.`memberShowPoint` AS `memberShowPoint`,`mb`.`memberCheckinPoint` AS `memberCheckinPoint`
    	from (`members` `m` join `memberships` `mb`
    	on((`mb`.`memberId` = `m`.`memberId`)));
    	)
  end
  def self.down
  	self.connection.execute "DROP VIEW IF EXSISTS membershipinfo;"
  end
end
