class CreateCheckininfodetailView < ActiveRecord::Migration
  def self.up
     self.connection.execute %Q(
     	CREATE OR REPLACE VIEW checkininfodetail AS
     	SELECT cc.deviceId AS deviceId,
     		   cc.beaconId AS beaconId,
     		   cc.memberId AS memberId,
     		   cc.countPerDeviceByShop AS countPerDeviceByShop,
     		   cc.lastCheckinTime AS lastCheckinTime,
     		   cc.nowCheckinTime AS nowCheckinTime,
     		   cc.countPerDeviceMonthByShop AS countPerDeviceMonthByShop,
     		   c.couponGet AS couponGet   		   
     	FROM checkins c INNER JOIN checkininfos cc
     	WHERE c.checkoutTime = 0 AND convert(cc.deviceId using utf8) = c.deviceId
     	GROUP BY c.beaconId, c.deviceId;
     	)
  end

  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS checkininfodetail;"
  end
end
