class Task < ApplicationRecord
	has_one :ad
	acts_as_taggable_on :skills
end
