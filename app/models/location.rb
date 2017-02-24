class Location < ApplicationRecord
	has_many :ads
	mount_uploaders :houseimages, HouseimagesUploader
	def country_name
		country = self.country
		ISO3166::Country[country]
	end	
end
