class Developer < ApplicationRecord
	#has_many :projects
	has_and_belongs_to_many :projects
	#has_and_belongs_to_many :skills
	#acts_as_taggable
	acts_as_taggable_on :skills, :interests
end
