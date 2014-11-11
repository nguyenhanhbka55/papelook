class ShopMember < ActiveRecord::Base
	#scope :staff_email, -> { where(staff_email: true) }
	scope :created_before, ->(time) { where("created_at < ?", time) }
	attr_accessor :password

	EMAIl_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
	validates :staff_email , format: { with: EMAIl_REGEX}, uniqueness: {case_sensitive: false}	
	validates :staff_email, :length => {:within => 5..30}, presence: true
	validates :password_confirmation, presence: true
	validates :password, :confirmation => true , presence: true

	before_save :encrypt_password

	def encrypt_password
		self.password_salt = BCrypt::Engine.generate_salt
		self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	end

	def self.authenticate(staff_email,password)
		shop_member = ShopMember.where(staff_email: staff_email).first
		if shop_member && shop_member.password_hash == BCrypt::Engine.hash_secret(password, shop_member.password_salt)
			shop_member
		else
			nil
		end
	end
end
