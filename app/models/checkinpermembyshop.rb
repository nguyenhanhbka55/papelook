class Checkinpermembyshop < ActiveRecord::Base
	belongs_to :device, foreign_key: "deviceId", -> { includes :beacon }	
end
