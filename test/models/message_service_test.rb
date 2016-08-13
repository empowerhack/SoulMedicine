require 'test_helper'

class MessageServiceTest < ActiveSupport::TestCase
	test "message service cannot save with no service" do
		a = MessageService.new(service: nil)
		assert_not a.save
	end
end
