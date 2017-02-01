class User < ApplicationRecord
	has_secure_password
	validates :email, confirmation: true
	validates :email_confirmation, presence: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true

	def country_name
	country = self.country
	ISO3166::Country[country]
	end
	
end
