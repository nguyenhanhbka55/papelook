class CreateCheckinpermembyshopView < ActiveRecord::Migration
  def self.up
   	self.connection.execute %Q(
   		CREATE OR REPLACE VIEW checkinpermembyshop AS
   		SELECT c.deviceId AS deviceId,
   			   c.beaconId AS beaconId,
   			   c.shopId AS shopId,
   			   c.memberId AS memberId,
   			   count(c.checkinTime) AS countPerDeviceByShop,
   			   max(c.checkinTime) AS lastCheckinTime,
   			   max(c.lastCheckinTime) AS nowCheckinTime
   		FROM checkins c
   		GROUP BY c.memberId,c.shopId,c.deviceId;
   		)
  end
  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS checkinpermembyshop;"
  end
end
