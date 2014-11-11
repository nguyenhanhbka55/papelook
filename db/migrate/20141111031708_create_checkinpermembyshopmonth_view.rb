class CreateCheckinpermembyshopmonthView < ActiveRecord::Migration
  def self.up
    self.connection.execute %Q(
    	CREATE OR REPLACE VIEW checkinpermembyshopmonth AS
    	SELECT c1.deviceId AS deviceId,
    		   c1.beaconId AS beaconId,
    		   c1.shopId AS shopId,
    		   c1.memberId AS memberId,
    		   count(c1.checkinTime) AS countPerDeviceMonthByShop
    	FROM checkins c1
    	WHERE (date_format(c1.checkinTime,'%m')= month(curdate()))
    	GROUP BY c1.memberId, c1.shopId;
    	)
  end
  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS checkinpermembyshopmonth;"
  end
end
