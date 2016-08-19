class MessageService < ActiveRecord::Base
	has_many :user_preferences

	validates_presence_of :service

	def to_s
		service.titlecase
	end
end
