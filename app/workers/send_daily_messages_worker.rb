class SendDailyMessagesWorker
  include Sidekiq::Worker
  sidekiq_options :retry => false
  def perform(timeOfDay)
      logger.info "Starting to send #{timeOfDay} sms messages"
      logger.info "Gathering all users with a #{timeOfDay} delivery time"
      users = User.joins(:user_preference).where(:user_preferences => {:delivery_time => "morning"}, :verified => true)
      users.each do |u|
        logger.info "Found User ##{u.id} - Mobile Number: #{u.mobile_number}"
        logger.info "Gathering all active courses for this user"
      end
  end
end