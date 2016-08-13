require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "Should not save to the db without a mobile number" do
	  a = User.new
	  assert_not a.save
  end

  test "Should not save to the db without a country ID" do
	  a = User.new(mobile_number: 07753225303, language_id: 2)
	  assert_not a.save
  end

  test "Should not save to the db without a language ID" do
	  a = User.new(mobile_number: 07753225303, country_id: 2)
	  assert_not a.save
  end

	test "Should Create Pin" do
		a = User.new(mobile_number: 07753225303, country_id: 2, language_id: 3)
		a.save
		assert_not a.pin.blank?
	end

	test "Mobile number should be unique" do
	a = User.new(mobile_number: 07753225303, country_id: 2, language_id: 3)
	b = User.new(mobile_number: 07753225303, country_id: 2, language_id: 3)
	a.save
	assert_not b.save
	end
end
