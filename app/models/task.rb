class Task < ApplicationRecord
	has_one :ad, :dependent => :destroy
	acts_as_taggable_on :skills
end
