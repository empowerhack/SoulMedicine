require 'test_helper'

class CountryTest < ActiveSupport::TestCase
  test "country cannot save with not country" do
	  a = Country.new(name: nil)
	  assert_not a.save
  end
end
