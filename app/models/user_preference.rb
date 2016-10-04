class UserPreference < ActiveRecord::Base
	# has_secure_password

	belongs_to :user
	belongs_to :gender
	belongs_to :native_language, class_name: 'Language'
	belongs_to :other_language_one, class_name: 'Language'
	belongs_to :other_language_two, class_name: 'Language'
	belongs_to :origin_country, class_name: 'Country'
	belongs_to :country_of_residence, class_name: 'Country'
	belongs_to :message_service_one, class_name: 'MessageService'
	belongs_to :message_service_two, class_name: 'MessageService'
	
	accepts_nested_attributes_for :gender
	accepts_nested_attributes_for :native_language
	accepts_nested_attributes_for :other_language_one
	accepts_nested_attributes_for :other_language_two
	accepts_nested_attributes_for :origin_country
	accepts_nested_attributes_for :country_of_residence

	# validates_presence_of :user_id, :gender_id, :native_language_id, :other_language_one_id,
	#                       :other_language_two_id, :origin_country_id, :country_of_residence_id, :consent, :age, :message_service_one_id,
	#                       :message_service_two_id, :first_name, :last_name, :email, :password, :password_confirmation
end

