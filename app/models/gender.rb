class Gender < ActiveRecord::Base
	has_many :user_preferences

	validates_presence_of :gender
end
