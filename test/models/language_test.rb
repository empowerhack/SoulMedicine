require 'test_helper'

class LanguageTest < ActiveSupport::TestCase
	test "Language cannot save with no name" do
		a = Language.new(name: nil)
		assert_not a.save
	end
end
