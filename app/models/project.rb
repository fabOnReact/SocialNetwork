class Project < ApplicationRecord
	has_many :tasks
	has_many :ads
	has_and_belongs_to_many :developers
	has_and_belongs_to_many :hosts
end
