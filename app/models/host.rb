class Host < ApplicationRecord
	has_and_belongs_to_many :projects
	has_many :locations
	mount_uploaders :houseimages, HouseimagesUploader
end
