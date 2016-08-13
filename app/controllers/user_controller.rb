require 'twilio-ruby'

class UserController < MessengerController

	layout 'logged_out'

  # Refactored Send message functionality into messenger_controller:
  # Messenger_controller inherits Application_controller & user inherits from messenger_controller

  def index
    @user = User.new
    @country = Country.new
  end

end
