require 'test_helper'

class GenderTest < ActiveSupport::TestCase
  test "gender can't be null" do
		g =	Gender.new(gender: nil)
		assert_not g.save
	end
end
