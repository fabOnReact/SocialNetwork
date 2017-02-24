class Location < ApplicationRecord
	mount_uploaders :houseimages, HouseimagesUploader
	def country_name
		country = self.country
		ISO3166::Country[country]
	end	
end
