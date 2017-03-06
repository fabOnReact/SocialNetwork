class Location < ApplicationRecord
	has_many :ads
	has_many :location_images
	accepts_nested_attributes_for :location_images
	accepts_nested_attributes_for :ads

	def country_name
		country = self.country
		ISO3166::Country[country]
	end	
end
