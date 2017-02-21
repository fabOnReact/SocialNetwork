class Location < ApplicationRecord
	def country_name
		country = self.country
		ISO3166::Country[country]
	end	
end
