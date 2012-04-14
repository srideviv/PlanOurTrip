class Trip < ActiveRecord::Base
	has_many :tourists
	has_many :itineraries
end
