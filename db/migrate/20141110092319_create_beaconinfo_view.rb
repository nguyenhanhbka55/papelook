class CreateBeaconinfoView < ActiveRecord::Migration

  def self.up
  	self.connection.execute %Q(
  		CREATE OR REPLACE VIEW beaconinfo AS
  		SELECT b.beaconId AS beaconId,
  			   bs.shopId AS shopId,
  			   b.beaconUniqueId AS beaconUniqueId,
  			   b.majorCode AS majorCode,
  			   b.minorCode AS minorCode,
  			   bs.property AS property,
  			   bs.status AS status,
  			   b.beaconTxt AS beaconTxt,
  			   bs.timeout AS timeout,
  			   b.manufacture AS manufacture
  		FROM beacons AS b INNER JOIN beacon_shops AS bs 
  		WHERE b.beaconId = bs.beaconId AND bs.status = 1;
  		)  		
  end
  def self.down
  	self.connection.execute "DROP VIEW IF EXISTS beaconinfo;"
  end

end 