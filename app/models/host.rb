class Host < ApplicationRecord
	has_and_belongs_to_many :projects, :dependent => :destroy
	has_many :locations, :dependent => :destroy
	acts_as_taggable_on :skills, :interests

end
