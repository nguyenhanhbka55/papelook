class BeaconShop < ActiveRecord::Base
	self.primary_key = "recId"
	#belongs_to :beacon, foreign_key: "beaconId"
end
