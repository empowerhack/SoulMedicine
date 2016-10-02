require 'test_helper'

class UserPreferenceTest < ActiveSupport::TestCase
	test "user cannot be null" do
		a = UserPreference.new(user_id: 1, gender_id: 1, native_language_id: 1,
		                       other_language_one_id: 1, other_language_two_id: 1,
		                       origin_country_id: 1, country_of_residence_id: 1,
		                       consent: 0, age: Date.today, message_service_one_id: 2)
		assert a.save
	end
end
