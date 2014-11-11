class CreateCheckininfoView < ActiveRecord::Migration
  def self.up
   self.connection.execute %Q(
   			CREATE OR REPLACE VIEW checkininfo AS
   			SELECT c.deviceId AS deviceId,
   				   c.beaconId AS beaconId,
   				   c.shopId AS shopId,
   				   c.memberId AS memberId,
   				   c.countPerDeviceByShop AS countPerDeviceByShop,
   				   c.lastCheckinTime AS lastCheckinTime, 
   				   c.nowCheckinTime AS nowCheckinTime,
   				   ifnull(cm.countPerDeviceMonthByShop,0) AS countPerDeviceMonthByShop   				   
   			FROM checkinpermembyshops c
   			LEFT JOIN checkinpermembyshopmonths cm
   			ON c.deviceId=cm.deviceId AND c.beaconId=cm.beaconId
   			ORDER BY c.lastCheckinTime;
   	)   
  end

  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS checkininfo;"  	
  end
end
