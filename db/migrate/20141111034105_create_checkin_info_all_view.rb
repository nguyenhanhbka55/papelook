class CreateCheckinInfoAllView < ActiveRecord::Migration
  def self.up
   	self.connection.execute %Q(
   		CREATE OR REPLACE VIEW checkin_info_all AS
   		select `s`.`shopId` AS `shopId`,
   			   `s`.`shopName` AS `shopName`,
   			   `s`.`shopNameFurigana` AS `shopNameFurigana`,
   			   `s`.`shopAdd` AS `shopAdd`,
   			   `s`.`shopEmail` AS `shopEmail`,
   			   `s`.`shopTel` AS `shopTel`,
   			   `s`.`shopUrl` AS `shopUrl`,
   			   `s`.`shopIconExt` AS `shopIconExt`,
   			   `s`.`shopImageExt` AS `shopImageExt`,
   			   `s`.`shopHeadline` AS `shopHeadline`,
   			   `s`.`shopTestimonials` AS `shopTestimonials`,
   			   `s`.`country` AS `country`,
   			   `s`.`city` AS `city`,
   			   `s`.`shopIconBinary` AS `shopIconBinary`,
   			   `s`.`shopImgBinary` AS `shopImgBinary`,
   			   `s`.`shopRankIconBinary` AS `shopRankIconBinary`,
   			   `s`.`shopRate` AS `shopRate`,
   			   `s`.`shopStatus` AS `shopStatus`,
   			   `s`.`shopFastCheckinLimit` AS `shopFastCheckinLimit`,
   			   `s`.`shopStartCheck` AS `shopStartCheck`,
   			   `c`.`countPerDeviceMonthByShop` AS `totalPerShopMonth`,
   			   `c`.`countPerDeviceByShop` AS `totalPerShop`,
   			   `c`.`memberId` AS `memberId`,
   			   (select `memberships`.`memberRank` from `memberships` where ((`memberships`.`memberId` = `c`.`memberId`) and (`memberships`.`shopId` = `s`.`shopId`))) AS `memberRank`,
   			   (select `memberships`.`memberCheckinPoint` from `memberships` where ((`memberships`.`memberId` = `c`.`memberId`) and (`memberships`.`shopId` = `s`.`shopId`))) AS `memberCheckinPoint`,
   			   `c`.`deviceId` AS `deviceId` 
   		from (`checkininfos` `c` join `shops` `s`)
   		where (`c`.`shopId` = `s`.`shopId`);
   		)
  end
  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS checkin_info_all;"
  end
end

